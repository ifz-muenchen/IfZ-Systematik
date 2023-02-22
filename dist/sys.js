/** global window, document */
const inputSubmit = document.querySelector('#search-navbar');
const inputSubmitIcon = document.querySelector('#searchIcon');

/** Request XML from server */
let sysXMLDoc = new Document;
const sysXMLDocRequest = fetch('./sys.xml', {method: 'GET'})
  .then(response => response.text())
  .then(string => new window.DOMParser().parseFromString(string, 'text/xml'))
  .then(data => sysXMLDoc = data);


/** Keydown listeners*/
window.addEventListener('keydown', event => {
  switch (event.key) {
    case 'Control':
      inputSubmit.value = '';
      inputSubmit.focus();
      break;
    case 't':
    case 'Escape':
      window.location.hash = '';
      break;
    case 's':
      window.location.hash = 'searchResults';
      break;
    case 'd':
      window.location.hash = 'übersichtAnhang1';
      break;
    case 'z':
      window.location.hash = 'übersichtAnhang2';
      break;
    default:
      return;
  }
});

/** Search event listener */
inputSubmit.addEventListener('keydown', function onEvent(event) {
  if (event.key === 'Enter' && event.target.value !== '') {
    search(event.target.value);
  } else {
    event.stopPropagation();
  }
});

inputSubmitIcon.addEventListener('click', () => {
  if (inputSubmit.value !== '') {
    search(inputSubmit.value);
  }
});

/**
 * Creates correct search request, moves viewport and hides previous results
 * @param {string} searchString User supplied search string, read via HTML input form
 */
function search(searchString) {
  document.querySelector('#searchResultsSystematik').classList.add('hidden');
  document.querySelector('#searchResultsNotation').classList.add('hidden');
  window.location.hash = 'searchResults';
  
  let fuzzySearch = searchString;
  fuzzySearch = fuzzySearch.trim();

  const inSystematik = `/sisis_classification_scheme/children/node[content/stichwort/text()[contains(., '${fuzzySearch}')]]`;
  const inNotation = `/sisis_classification_scheme/children/node/children/node/children/node[content/stichwort/text()[contains(., '${fuzzySearch}')]]`;
  const forNotation = `//node[@notation='${fuzzySearch}']`;
  
  /** Search for a specific Notation or look for the searchString in "@Stichwort" */
  const notationRegex = /^[a-z]{1,3} \d{1,3}(?:-\d{1,3}|.\d.?\d?)?$/gmi;
  if (notationRegex.test(fuzzySearch)) {
    searchRequest(forNotation, 'Notation');
  } else {
    searchRequest(inSystematik, 'Systematik');
    searchRequest(inNotation, 'Notation');
  }

  console.log(`Searching for ${fuzzySearch}`);

  /**
   * Searches the XML via xPath and creates output tables on the page
   * @TODO maybe performance upgrades? Creating the HTML elements seems to be the bottleneck, check via Chrome
   * 
   * @param {string} searchPath xPath string for search
   * @param {string} searchType Helper to distinguish between results
   */
  function searchRequest(searchPath, searchType) {
    const tNode = document.querySelector(`#searchResults${searchType}Table`);
    document.querySelector(`#searchResults${searchType}TableBody`).remove();
    const tbodyNode = document.createElement('tbody');
    tbodyNode.setAttribute('id', `searchResults${searchType}TableBody`);

    for (const resultNode of evaluateXPath(sysXMLDoc, searchPath)) {
      document.querySelector(`#searchResults${searchType}`).classList.remove('hidden');

      /** Create new nodes */
      const tr = document.createElement('tr');
      const th = document.createElement('th');
      const thA = document.createElement('a');
      const tdBenennung = document.createElement('td');
      const spanBemerkung = document.createElement('span');
      
      /** Add Tailwind classes and other attributes to newly created elements */
      tr.classList.add('bg-white', 'border-b', 'dark:bg-gray-800', 'dark:border-gray-700', 'hover:bg-blue-100', 'dark:hover:bg-gray-600');
      th.classList.add('px-3', 'py-2', 'font-medium', 'underline', 'text-gray-900', 'whitespace-nowrap', 'dark:text-white');
      th.setAttribute('scope', 'row');
      thA.setAttribute('target', '_new');
      thA.setAttribute('href', `https://opac.ifz-muenchen.de/cgi-bin/search?ifzsys=${resultNode.getAttribute('notation')}`);
      tdBenennung.classList.add('px-3', 'py-2');
      spanBemerkung.classList.add('text-xs');

      /** Create new text nodes */
      const thAText = document.createTextNode(resultNode.getAttribute('notation'));
      const tdBenennungText = document.createTextNode(resultNode.getAttribute('benennung'));
      const spanBemerkungText = document.createTextNode(resultNode.childNodes[1].getAttribute('bemerkung'));

      /** Create html structure */
      th.appendChild(thA).appendChild(thAText);
      tdBenennung.appendChild(tdBenennungText);
      tdBenennung.appendChild(document.createElement('br'));
      tdBenennung.appendChild(spanBemerkung);
      spanBemerkung.appendChild(spanBemerkungText);
      tr.appendChild(th);
      tr.appendChild(tdBenennung);

      /** Append table entry to table body */
      tbodyNode.appendChild(tr);
    }

    tNode.appendChild(tbodyNode);
  }
}

/**
 * Helper function wrapping document.evaluate to streamline results
 * @param {Node} aNode 
 * @param {string} aExpr 
 * @returns {Array} All Nodes found
 */
function evaluateXPath(aNode, aExpr) {
  const xpe = new XPathEvaluator();
  const nsResolver = xpe.createNSResolver(
    aNode.ownerDocument === null
      ? aNode.documentElement
      : aNode.ownerDocument.documentElement
  );
  const result = xpe.evaluate(aExpr, aNode, nsResolver, 0, null);
  const found = [];
  let res;
  while (res = result.iterateNext()) {found.push(res);}

  return found;
}
