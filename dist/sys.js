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

/** Initialize dark mode at first website visit */
if (!darkMode) {
  localStorage.setItem('darkMode', 'off');
}

/** Add inline notation references */
const elementsWithInlineRef = document.querySelectorAll('.addLinkToInlineNotation');
elementsWithInlineRef.forEach(element => {
  element.innerHTML = element.textContent.replace(/(?<=vgl. |s. |siehe: | - |, | bis )([a-z]{1,3} \d{1,3}(?:-\d{1,3}\.?\d{1,3}|\.\d{1,3}(?:\.\d{1,3})?)?\b)/gmi, (m, p1) => `<strong id='clickToSearch' class='font-semibold text-ifz-dark-blue dark:text-ifz-text-white cursor-pointer'>${p1}</strong>`);
});

/** Search in new tab if CTRL was pressed during click on element */
document.querySelectorAll('#clickToSearch').forEach(element => {
  element.addEventListener('click', (event) => {
    if (event.ctrlKey) {
      window.open(document.URL.replace(/#.*$/, `#searchResults&${element.textContent}`), '_blank');
    } else {
      search(element.textContent)
    }
  });
});

/** Initialize array to track previous search results */
const searches = new Array();
let pointer = -1;
localStorage.setItem('history', JSON.stringify(searches));

/** Keydown listeners*/
window.addEventListener('keydown', event => {
  switch (event.key) {
    case 'AltGraph':
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
    case 'h':
      const manualDiv = document.querySelector('#nutzungshinweiseDiv');

      if (manualDiv.classList.contains('hidden')) {
        manualDiv.classList.remove('hidden');
        document.querySelector('#nutzungshinweiseArrow').classList.remove('hidden');
        manualDiv.classList.remove('pointer-events-none');
      } else {
        manualDiv.classList.add('hidden');
        document.querySelector('#nutzungshinweiseArrow').classList.add('hidden');
        manualDiv.classList.add('pointer-events-none');
      }
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
    case 'ArrowLeft':
    case 'Backspace':
      if (pointer > 0) {
        pointer--;
        const previousElement = searches[pointer];
        search(previousElement, true);
      }
      break;
    case 'ArrowRight':
      if (pointer < searches.length - 1) {
        pointer++;
        const nextElement = searches[pointer];
        search(nextElement, true);
      }
      break;
    default:
      return;
  }
});

/** Change view click listeners */
document.querySelector('#alpha-button').addEventListener('click', () => {
  document.querySelector('#currentTab').innerHTML = 'Alphabetisch';
  document.querySelector(`#mainHeadline`).innerHTML = 'Systematik der Bibliothek';
  document.querySelector(`#mainLowHeadline`).innerHTML = 'von a bis x';
  
  document.querySelector('#alphaMain').classList.remove('hidden');
  document.querySelector('#übersichtAnhang1').classList.remove('hidden');
  document.querySelector('#alphaÜbersicht2').classList.remove('hidden');
  document.querySelector('#chrono-button').classList.remove('ring-4');
  document.querySelector('#sach-button').classList.remove('ring-4');
  
  document.querySelector('#alpha-button').classList.add('ring-4');
  document.querySelector('#chronoMain').classList.add('hidden');
  document.querySelector('#sachMain').classList.add('hidden');
  document.querySelector('#chronoÜbersicht2').classList.add('hidden');
  document.querySelector('#sachÜbersicht2').classList.add('hidden');
});

document.querySelector('#sach-button').addEventListener('click', () => {
  document.querySelector('#currentTab').innerHTML = 'Sachgruppen';
  document.querySelector(`#mainHeadline`).innerHTML = 'Sachgruppen der Bibliothek und der Druckschriften des Archivs';
  document.querySelector(`#mainLowHeadline`).innerHTML = 'von a bis w';
  
  document.querySelector('#sachMain').classList.remove('hidden');
  document.querySelector('#sachÜbersicht2').classList.remove('hidden');
  document.querySelector('#alpha-button').classList.remove('ring-4');
  document.querySelector('#chrono-button').classList.remove('ring-4');
  
  document.querySelector('#sach-button').classList.add('ring-4');
  document.querySelector('#alphaMain').classList.add('hidden');
  document.querySelector('#chronoMain').classList.add('hidden');
  document.querySelector('#chronoÜbersicht2').classList.add('hidden');
  document.querySelector('#übersichtAnhang1').classList.add('hidden');
  document.querySelector('#alphaÜbersicht2').classList.add('hidden');
});

document.querySelector('#chrono-button').addEventListener('click', () => {
  document.querySelector('#currentTab').innerHTML = 'Chronologisch';
  document.querySelector(`#mainHeadline`).innerHTML = 'Gruppen der Bibliothek und der Druckschriften des Archivs';
  document.querySelector(`#mainLowHeadline`).innerHTML = 'in historisch chronologischer Reihenfolge';
  
  document.querySelector('#chronoMain').classList.remove('hidden');
  document.querySelector('#chronoÜbersicht2').classList.remove('hidden');
  document.querySelector('#alpha-button').classList.remove('ring-4');
  document.querySelector('#sach-button').classList.remove('ring-4');

  document.querySelector('#chrono-button').classList.add('ring-4');
  document.querySelector('#alphaMain').classList.add('hidden');
  document.querySelector('#sachMain').classList.add('hidden');
  document.querySelector('#übersichtAnhang1').classList.add('hidden');
  document.querySelector('#alphaÜbersicht2').classList.add('hidden');
  document.querySelector('#sachÜbersicht2').classList.add('hidden');
});

/** Footer Clicks */
document.querySelector('#nutzungshinweiseButton').addEventListener('click', () => {
  document.querySelector('#nutzungshinweiseDiv').classList.remove('hidden');
  document.querySelector('#nutzungshinweiseArrow').classList.remove('hidden');
  document.querySelector('#nutzungshinweiseDiv').classList.remove('pointer-events-none');
})

document.querySelector('#nutzungshinweiseDiv').addEventListener('click', () => {
  document.querySelector('#nutzungshinweiseDiv').classList.add('hidden');
  document.querySelector('#nutzungshinweiseArrow').classList.add('hidden');
  document.querySelector('#nutzungshinweiseDiv').classList.add('pointer-events-none');
})

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
document.querySelector('#h-button').addEventListener('click', () => {
  const manualDiv = document.querySelector('#nutzungshinweiseDiv');

  if (manualDiv.classList.contains('hidden')) {
    manualDiv.classList.remove('hidden');
    document.querySelector('#nutzungshinweiseArrow').classList.remove('hidden');
    manualDiv.classList.remove('pointer-events-none');
  } else {
    manualDiv.classList.add('hidden');
    document.querySelector('#nutzungshinweiseArrow').classList.add('hidden');
    manualDiv.classList.add('pointer-events-none');
  }
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

document.querySelector('#prevHistory').addEventListener('click', () => {
  if (pointer > 0) {
    pointer--;
    const previousElement = searches[pointer];
    search(previousElement, true);
  }
})

document.querySelector('#nextHistory').addEventListener('click', () => {
  if (pointer < searches.length - 1) {
    pointer++;
    const nextElement = searches[pointer];
    search(nextElement, true);
  }
})

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
function search(searchString, hideFromHistory) {
  //document.querySelector('#searchResultsSystematik').classList.add('hidden');
  document.querySelector('#searchResultsNotation').classList.add('hidden');
  window.location.hash = 'searchResults';
  
  let fuzzySearch = searchString;
  fuzzySearch = fuzzySearch.trim().toLowerCase();   

  if (!hideFromHistory) {
    searches.push(searchString);
    localStorage.history = JSON.stringify(searches);   
    pointer = searches.length - 1;
  }

  /** Search for a specific Notation or look for the searchString in "@Stichwort" */
  const notationRegex = /^[a-z]{1,3} \d{1,3}(?:\.\d{1,3}){0,2}$/gmi;
  const notationRangeRegex = /^[a-z]{1,3} \d{1,3}(?:\.\d{1,3}){0,2}-\d{1,3}(?:\.\d{1,3}){0,2}$/gmi;

  if (fuzzySearch.includes('-') && document.getElementById(fuzzySearch)) {
    window.location.hash = `#${fuzzySearch}`;
    return;
  }
  
  if (notationRegex.test(fuzzySearch)) {
    const forNotation = `//*[translate(name(), '_', ' ')='${fuzzySearch}'] | //*[contains(translate(name(), '_', ' '), '${fuzzySearch}.')]`;
    //const forNotation2 = `//*[contains(translate(name(), '_', ' '), '${fuzzySearch}')]`;
    
    searchRequest(forNotation, 'Notation', fuzzySearch); // Search for a string that seems to be a singular notation
  } else if (notationRangeRegex.test(fuzzySearch)) {
    const parts = fuzzySearch.trim().replace(' ', '_').split('-');
    const part1 = parts[0];
    const part2 = `${parts[0].match(/^[a-z]{1,3}/gmi)[0]}_${parts[1]}`;
    const notationRange = `//${part1} | //*[preceding::${part1}][following::${part2}] | //${part2}`;
    
    searchRequest(notationRange, 'Notation', fuzzySearch); // Search for a string that seems to be a range of notations, f.e. r 75-75.4
  } else {
    let inNotationBenennung = `//*[@Benennung[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZÜÖÄ', 'abcdefghijklmnopqrstuvwxyzüöä'), '${fuzzySearch}')]] | //*[@Verweisformen[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZÜÖÄ', 'abcdefghijklmnopqrstuvwxyzüöä'), '${fuzzySearch}')]] | //*[@Register-Vokabular[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZÜÖÄ', 'abcdefghijklmnopqrstuvwxyzüöä'), '${fuzzySearch}')]]`;
    
    if (fuzzySearch.includes('|')) {
      const searchArray = fuzzySearch.split('|');
      searchArray.forEach(element => {
        inNotationBenennung = `${inNotationBenennung} | //*[@Benennung[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZÜÖÄ', 'abcdefghijklmnopqrstuvwxyzüöä'), '${element.trim()}')]] | //*[@Verweisformen[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZÜÖÄ', 'abcdefghijklmnopqrstuvwxyzüöä'), '${element.trim()}')]] | //*[@Register-Vokabular[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZÜÖÄ', 'abcdefghijklmnopqrstuvwxyzüöä'), '${element.trim()}')]]`;      
      }); 
    }

    searchRequest(inNotationBenennung, 'Notation', searchString); // Search for a string in the attribute "Benennung"
  }

  /**
   * Searches the XML via xPath and creates output tables on the page
   * @TODO maybe performance upgrades? Creating the HTML elements seems to be the bottleneck, check via Chrome
   * 
   * @param {string} searchPath xPath string for search
   * @param {string} searchType Helper to distinguish between results
   */
  function searchRequest(searchPath, searchType, searchString) {
    const tNode = document.querySelector(`#searchResults${searchType}Table`);
    const tbodyNode = document.createElement('tbody');
    document.querySelector(`#searchResults${searchType}TableBody`).remove();
    tbodyNode.setAttribute('id', `searchResults${searchType}TableBody`);
    document.querySelector(`#searchResults${searchType}`).classList.remove('hidden');
    document.querySelector('#searchResultsNothing').classList.add('hidden');
    document.querySelector(`#ergebnisHeadline`).textContent = searchString;

    console.log(searchString);
    
    for (const resultNode of evaluateXPath(sysXMLDoc, searchPath)) {
      const currentNotation = resultNode.tagName.replace('_', ' ');
      
      /** Create new nodes */
      const tr = document.createElement('tr');
      const th = document.createElement('th');
      const thA = document.createElement('a');
      const tdBenennung = document.createElement('td');
      const spanBemerkung = document.createElement('span');
      
      /** Add Tailwind classes and other attributes to newly created elements */
      tr.classList.add('bg-ifz-lightmode-table-background', 'border-ifz-lightmode-table-border', 'border-b', 'dark:bg-ifz-darkmode-table-background', 'dark:border-ifz-darkmode-table-border', 'hover:bg-ifz-light-blue', 'dark:hover:bg-gray-600');
      th.classList.add('px-3', 'py-2', 'font-medium', 'text-ifz-text-black','whitespace-pre', 'dark:text-ifz-text-white', 'align-top');
      th.setAttribute('scope', 'row');
      thA.setAttribute('target', '_new');
      thA.setAttribute('href', `https://opac.ifz-muenchen.de/cgi-bin/search?ifzsys=${currentNotation}`);
      tdBenennung.classList.add('px-3', 'py-2', 'whitespace-pre-wrap');
      spanBemerkung.classList.add('text-xs', 'font-semibold');

      /** Create innerHtml for bennung and notation link */
      if (currentNotation.includes('-') && currentNotation.includes('9') ) {
        th.innerHTML = `<a href='#${currentNotation}' class='underline'>${currentNotation}</a>`;
      } if (currentNotation.includes('-')) {
        th.innerHTML = `<span id='clickToSearchInSearchResults' class='underline cursor-pointer'>${currentNotation}</span>`;
      } else {
        th.innerHTML = `<a target='_blank' href='https://opac.ifz-muenchen.de/cgi-bin/search?ifzsys=${currentNotation}' class='underline'>${currentNotation}</a>`;
      }
      tdBenennung.innerHTML = `<span class='font-semibold'>${resultNode.getAttribute('Benennung')}</span>`;
      spanBemerkung.innerHTML = resultNode.getAttribute('Bemerkungen');

      /** Arrow Notation for higher notations */
      const regexPointPattern = /[a-z]{1,3} \d{1,3}\.?\d{0,3}(?=\.\d{0,3})/gmi;
      let level = currentNotation;
      let levelBenenung = document.querySelector(`#${CSS.escape(level)}-benennung`).textContent;

      while (regexPointPattern.test(level)) {
        level = level.match(regexPointPattern)[0];
        levelBenenung = document.querySelector(`#${CSS.escape(level)}-benennung`).textContent;

        let currentHeader = th.innerHTML;
        let currentData = tdBenennung.innerHTML;
        th.innerHTML = `<span>${level}</span>\n↳\t${currentHeader}`;
        tdBenennung.innerHTML = `<span class='font-thin'>${levelBenenung}</span>\n▸\t${currentData}`;
      }

      let currentNode = resultNode.parentNode;
      while (currentNode.nodeName !== 'IfZ-Systematik') {
        let currentHeader = th.innerHTML;
        let currentData =tdBenennung.innerHTML;

        th.innerHTML = `<span>${currentNode.tagName.replace('_', ' ')}</span>\n↳\t${currentHeader}`;
        tdBenennung.innerHTML = `<span class='font-thin'>${currentNode.getAttribute('Benennung')}</span>\n▸\t${currentData}`;

        currentNode = currentNode.parentNode;
      }

      /** Add inline reference link */
      spanBemerkung.innerHTML = spanBemerkung.innerHTML.replace(/(?<=vgl. |s. |siehe: | - |, | bis )([a-z]{1,3} \d{1,3}(?:-\d{1,3}\.?\d{1,3}|\.\d{1,3}(?:\.\d{1,3})?)?\b)/gmi, (m, p1) => `<strong id='clickToSearchInSearchResults' class='font-semibold text-ifz-dark-blue dark:text-ifz-text-white cursor-pointer'>${p1}</strong>`);
      if (resultNode.getAttribute('Bemerkungen')) {
        spanBemerkung.innerHTML = `&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${spanBemerkung.innerHTML}`;
      }

      /** Create html structure */
      tdBenennung.appendChild(document.createElement('br'));
      tdBenennung.appendChild(spanBemerkung);
      tr.appendChild(th);
      tr.appendChild(tdBenennung);

      /** Append table entry to table body */
      tbodyNode.appendChild(tr);
    }

    tNode.appendChild(tbodyNode);

    /** No search results found */
    if (!tbodyNode.hasChildNodes()) {
      document.querySelector('#searchResultsNothing').classList.remove('hidden');
    }
  }

  /** Search in new tab if CTRL was pressed during click on element */
  document.querySelectorAll('#clickToSearchInSearchResults').forEach(element => {
    element.addEventListener('click', (event) => {
      if (event.ctrlKey) {
        window.open(document.URL.replace(/#.*$/, `#searchResults&${element.textContent}`), '_blank');
      } else {
        search(element.textContent);
      }
    });
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

/** If the URL has a notation in it, search for it when loading the page */
if (window.location.href.includes('&')) {
  const searchTarget = decodeURI(window.location.href.split('&')[1]);
  await sysXMLDocRequest;
  console.log(searchTarget);
  search(searchTarget);
  window.location.hash = '#';
  window.location.hash = 'searchResults';
};
