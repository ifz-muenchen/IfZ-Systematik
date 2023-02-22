/** global document */
let sysXMLDoc = new Document;

/** Request XML from server */
const sysXMLDocRequest = fetch('./sys.xml', {method: 'GET'})
  .then(response => response.text())
  .then(string => new window.DOMParser().parseFromString(string, 'text/xml'))
  .then(data => sysXMLDoc = data);


/** Search event listener */
const inputSubmit = document.querySelector('#search-navbar');
inputSubmit.addEventListener('keydown', function onEvent(event) {
  if (event.key === 'Enter' && event.target.value !== '') {
    search(event.target.value);
  }
});

/** Search function */
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
    searchForNotation(forNotation, 'Notation');
  } else {
    searchForNotation(inSystematik, 'Systematik');
    searchForNotation(inNotation, 'Notation');
  }

  console.log(`Searching for ${fuzzySearch}`);
  return;
  
  function searchForNotation(searchPath, searchType) {
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

  function searchInNotation(searchPath) {
    const tNode = document.querySelector('#searchResultsNotationTable');
    document.querySelector('#searchResultsNotationTableBody').remove();
    const tbodyNode = document.createElement('tbody');
    tbodyNode.setAttribute('id', 'searchResultsNotationTableBody');

    for (const resultNode of evaluateXPath(sysXMLDoc, searchPath)) {
      document.querySelector('#searchResultsNotation').classList.remove('hidden');

      /** Create new nodes */
      const tr = document.createElement('tr');
      const th = document.createElement('th');
      const thA = document.createElement('a');
      const tdBenennung = document.createElement('td');
      const tdBemerkung = document.createElement('td');
      
      /** Add Tailwind classes and other attributes to newly created elements */
      tr.classList.add('bg-white', 'border-b', 'dark:bg-gray-800', 'dark:border-gray-700', 'hover:bg-blue-100', 'dark:hover:bg-gray-600');
      th.classList.add('px-3', 'py-2', 'font-medium', 'underline', 'text-gray-900', 'whitespace-nowrap', 'dark:text-white');
      th.setAttribute('scope', 'row');
      thA.setAttribute('target', '_new');
      thA.setAttribute('href', `https://opac.ifz-muenchen.de/cgi-bin/search?ifzsys=${resultNode.getAttribute('notation')}`);
      tdBenennung.classList.add('px-3', 'py-2');
      tdBemerkung.classList.add('px-3', 'py-2');

      /** Create new text nodes */
      const thAText = document.createTextNode(resultNode.getAttribute('notation'));
      const tdBenennungText = document.createTextNode(resultNode.getAttribute('benennung'));
      const tdBemerkungText = document.createTextNode(resultNode.childNodes[1].getAttribute('bemerkung'));

      /** Create html structure */
      th.appendChild(thA).appendChild(thAText);
      tdBenennung.appendChild(tdBenennungText);
      tdBemerkung.appendChild(tdBemerkungText);
      tr.appendChild(th);
      tr.appendChild(tdBenennung);
      tr.appendChild(tdBemerkung);

      /** Append table entry to table body */
      tbodyNode.appendChild(tr);
    }

    tNode.appendChild(tbodyNode);
  }
  
  function searchInSystematik(searchPath) {
    const tbodyNode = document.querySelector('#searchResultsSystematikTable');
    while (tbodyNode.firstChild) {
      tbodyNode.removeChild(tbodyNode.firstChild);
    }

    for (const resultNode of evaluateXPath(sysXMLDoc, searchPath)) {
      document.querySelector('#searchResultsSystematik').classList.remove('hidden');

      /** Create new nodes */
      const tr = document.createElement('tr');
      const th = document.createElement('th');
      const thA = document.createElement('a');
      const tdBenennung = document.createElement('td');
      const tdBemerkung = document.createElement('td');
      
      /** Add Tailwind classes and other attributes to newly created elements */
      tr.classList.add('bg-white', 'border-b', 'dark:bg-gray-800', 'dark:border-gray-700', 'hover:bg-blue-100', 'dark:hover:bg-gray-600');
      th.classList.add('px-3', 'py-2', 'font-medium', 'underline', 'text-gray-900', 'whitespace-nowrap', 'dark:text-white');
      th.setAttribute('scope', 'row');
      thA.setAttribute('target', '_new');
      thA.setAttribute('href', `https://opac.ifz-muenchen.de/cgi-bin/search?ifzsys=${resultNode.getAttribute('notation')}`);
      tdBenennung.classList.add('px-3', 'py-2');
      tdBemerkung.classList.add('px-3', 'py-2');

      /** Create new text nodes */
      const thAText = document.createTextNode(resultNode.getAttribute('notation'));
      const tdBenennungText = document.createTextNode(resultNode.getAttribute('benennung'));
      const tdBemerkungText = document.createTextNode(resultNode.childNodes[1].getAttribute('bemerkung'));

      /** Create html structure */
      th.appendChild(thA).appendChild(thAText);
      tdBenennung.appendChild(tdBenennungText);
      tdBemerkung.appendChild(tdBemerkungText);
      tr.appendChild(th);
      tr.appendChild(tdBenennung);
      tr.appendChild(tdBemerkung);

      /** Append table entry to table body */
      tbodyNode.appendChild(tr);
    }
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
