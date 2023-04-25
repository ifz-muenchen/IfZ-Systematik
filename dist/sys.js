/** global window, document */
const inputSubmit = document.querySelector('#search-navbar');
const inputSubmitIcon = document.querySelector('#searchIcon');
const darkMode = localStorage.getItem('darkMode');

/** Request XML from server */
let sysXMLDoc = new Document;
const sysXMLDocRequest = fetch('./sys.xml', {method: 'GET'})
  .then(response => response.text())
  .then(string => new window.DOMParser().parseFromString(string, 'text/xml'))
  .then(data => sysXMLDoc = data);

/** Initialise dark mode af first website visit */
if (!darkMode) {
  localStorage.setItem('darkMode', 'on');
}

/** Add inline notation references */
const elementsWithInlineRef = document.querySelectorAll('.addLinkToInlineNotation');
elementsWithInlineRef.forEach(element => {
  element.innerHTML = element.textContent.replace(/([a-z]{1,3} \d{1,3}(?:-\d{1,3}|.\d.?\d?)?\b)/gmi, (m, p1) => `<strong id='clickToSearch' class='font-semibold text-gray-900 dark:text-white cursor-pointer'>${p1}</strong>`);
});

document.querySelectorAll('#clickToSearch').forEach(element => {
  element.addEventListener('click', () => {
    search(element.textContent);
  });
});

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
    case 'm':
      const htmlTagClasslist = document.querySelector('#html').classList;
      if (htmlTagClasslist.contains('dark')) {
        htmlTagClasslist.remove('dark');
        localStorage.setItem('darkMode', 'off');
      } else {
        htmlTagClasslist.add('dark');
        localStorage.setItem('darkMode', 'on');
      }
      break;
    default:
      return;
  }
});

/** Help dial click listeners */
document.querySelector('#strg-button').addEventListener('click', () => {
  inputSubmit.value = '';
  inputSubmit.focus();
});
document.querySelector('#s-button').addEventListener('click', () => {
  window.location.hash = 'searchResults';
});
document.querySelector('#esc-button').addEventListener('click', () => {
  window.location.hash = '';
});
document.querySelector('#d-button').addEventListener('click', () => {
  window.location.hash = 'übersichtAnhang1';
});
document.querySelector('#z-button').addEventListener('click', () => {
  window.location.hash = 'übersichtAnhang2';
});
document.querySelector('#m-button').addEventListener('click', () => {
  const htmlTagClasslist = document.querySelector('#html').classList;
  if (htmlTagClasslist.contains('dark')) {
    htmlTagClasslist.remove('dark');
    localStorage.setItem('darkMode', 'off');
  } else {
    htmlTagClasslist.add('dark');
    localStorage.setItem('darkMode', 'on');
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

/** Search at lower breakpoint */
inputSubmitIcon.addEventListener('click', () => {
  if (inputSubmit.value !== '') {
    search(inputSubmit.value);
  }
});

/** Help Dial Show */
helpDial.addEventListener('mouseover', () => {
  document.querySelector('#helpDialMenu').classList.remove('hidden');
})

/** Help Dial Hide */
helpDial.addEventListener('mouseout', () => {
  document.querySelector('#helpDialMenu').classList.add('hidden');
})


/**
 * Creates correct search request, moves viewport and hides previous results
 * @param {string} searchString User supplied search string, read via HTML input form
 */
function search(searchString) {
  document.querySelector('#searchResultsSystematik').classList.add('hidden');
  document.querySelector('#searchResultsNotation').classList.add('hidden');
  window.location.hash = 'searchResults';
  
  let fuzzySearch = searchString;
  fuzzySearch = fuzzySearch.trim().toLowerCase();

  const inSystematikStichwort = `/sisis_classification_scheme/children/node[content/stichwort/text()[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZÜÖÄ', 'abcdefghijklmnopqrstuvwxyzüöä'), '${fuzzySearch}')]]`;
  const inSystematikBenennung = `/sisis_classification_scheme/children/node[contains(@benennung, ${fuzzySearch})]`;
  const inNotationStichwort = `/sisis_classification_scheme/children/node/children/node/children/node[content/stichwort/text()[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '${fuzzySearch}')]]`;
  const inNotationBenennung = `/sisis_classification_scheme/children/node/children/node/children/node[@benennung[contains(., ${fuzzySearch})]]`;
  const forNotation = `//node[@notation='${fuzzySearch}']`;
  
  /** Search for a specific Notation or look for the searchString in "@Stichwort" */
  const notationRegex = /^[a-z]{1,3} \d{1,3}(?:-\d{1,3}|.\d.?\d?)?$/gmi;
  if (notationRegex.test(fuzzySearch)) {
    searchRequest(forNotation, 'Notation');
  } else {
    searchRequest(inSystematikStichwort, 'Systematik');
    searchRequest(inNotationStichwort, 'Notation');
    //searchRequest(inSystematikBenennung, 'Systematik');
    //searchRequest(inNotationBenennung, 'Notation');
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

      const resultParentNode = resultNode.parentNode.parentNode;
      const resultParentNotation = resultParentNode.getAttribute('notation');
      const resultParentBenennung = resultParentNode.getAttribute('benennung');
      const resultParentParentNode = resultParentNode.parentNode.parentNode ?? resultParentNode;
      const resultParentParentNotation = resultParentParentNode.getAttribute('notation') ?? 'null';
      const resultParentParentBenennung = resultParentParentNode.getAttribute('benennung') ?? 'null';

      /** Create new nodes */
      const tr = document.createElement('tr');
      const th = document.createElement('th');
      const thA = document.createElement('a');
      const tdBenennung = document.createElement('td');
      const spanBemerkung = document.createElement('span');
      
      /** Add Tailwind classes and other attributes to newly created elements */
      tr.classList.add('bg-white', 'border-b', 'dark:bg-gray-800', 'dark:border-gray-700', 'hover:bg-blue-100', 'dark:hover:bg-gray-600');
      th.classList.add('px-3', 'py-2', 'font-medium', 'text-gray-900','whitespace-pre', 'dark:text-white');
      th.setAttribute('scope', 'row');
      thA.setAttribute('target', '_new');
      thA.setAttribute('href', `https://opac.ifz-muenchen.de/cgi-bin/search?ifzsys=${resultNode.getAttribute('notation')}`);
      tdBenennung.classList.add('px-3', 'py-2', 'whitespace-pre');
      spanBemerkung.classList.add('text-xs', 'font-semibold');
      
      /** Create new text nodes */
      let spanBemerkungText = document.createTextNode(`\t\t${resultNode.childNodes[1].getAttribute('bemerkung')}`);

      /** Create innerHtml for bennung and notation link */
      if (searchType === 'Systematik') {
        th.innerHTML = resultNode.getAttribute('notation');
        tdBenennung.innerHTML = resultNode.getAttribute('benennung');
        spanBemerkungText.textContent = spanBemerkungText.textContent.trim();
      } else {
        th.innerHTML = `<a href='#${resultParentParentNotation}'>${resultParentParentNotation}\n ↳\t${resultParentNotation}</a>\n\t ↳\t<a target='_blank' href='https://opac.ifz-muenchen.de/cgi-bin/search?ifzsys=${resultNode.getAttribute('notation')}' class='underline'>${resultNode.getAttribute('notation')}</a>`;
        tdBenennung.innerHTML = `<span class='font-thin'>${resultParentParentBenennung}</span>\n ↳\t<span class='font-thin'>${resultParentBenennung}</span>\n\t ↳\t<span class='font-semibold'>${resultNode.getAttribute('benennung')}</span>`
      }

      /** Add inline reference link */
      spanBemerkung.innerHTML = spanBemerkungText.textContent.replace(/([a-z]{1,3} \d{1,3}(?:-\d{1,3}|.\d.?\d?)?\b)/gmi, (m, p1) => `<strong id='clickToSearchInSearchResults' class='font-semibold text-gray-900 dark:text-white cursor-pointer'>${p1}</strong>`);

      /** Create html structure */
      tdBenennung.appendChild(document.createElement('br'));
      tdBenennung.appendChild(spanBemerkung);
      tr.appendChild(th);
      tr.appendChild(tdBenennung);

      /** Append table entry to table body */
      tbodyNode.appendChild(tr);
    }

    tNode.appendChild(tbodyNode);
  }

  document.querySelectorAll('#clickToSearchInSearchResults').forEach(element => {
    element.addEventListener('click', () => search(element.textContent));
  });
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
