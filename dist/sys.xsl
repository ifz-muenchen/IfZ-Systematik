<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" encoding="utf-8" indent="yes" />

<xsl:template match="/sisis_classification_scheme">
  <!--<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>-->
  <html id="html" class="dark">
  <script>
    if (localStorage.getItem('darkMode') === 'off') {
      document.querySelector('#html').classList.remove('dark');
    }
  </script>
  <head>  
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link href="tailwind.css" rel="stylesheet"></link>
    <link href="img/favicon.ico" rel="icon" type="image/x-icon"></link>

    <title>IfZ Systematik</title>
  </head>
  <body class="bg-white dark:bg-gray-900">

    <!-- Navigation bar -->
    <nav class="sticky bg-white border-gray-200 p-3 w-full z-20 top-0 left-0 border-b dark:bg-gray-800">
      <div class="max-w-[1750px] flex flex-wrap items-center justify-between mx-auto">
        <a href="https://ifz-muenchen.de/"><img src="img/logo.png" class="mr-3 h-10" alt="IfZ Logo"/></a>
        <div class="grow">
          <a href="#" class="text-gray-700 text-3xl font-semibold whitespace-nowrap dark:text-white">IfZ-Systematik</a>
        </div>
        <div class="flex md:order-2 my-3 sm:my-0">
          <div class="relative block">
            <button id="searchIcon" class="absolute inset-y-0 left-0 flex items-center pl-3">
              <svg class="w-8 h-8 text-gray-500" aria-hidden="true" fill="currentColor" viewBox="0 0 25 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
            </button>
            <input type="text" id="search-navbar" class="block w-full p-2 pl-10 text-3xl text-gray-900 border border-gray-300 rounded-lg bg-gray-50 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white" placeholder="Systematik durchsuchen..."/>
          </div>
        </div>
      </div>
    </nav>

    <!-- Main page content -->
    <div id="pageMain" class="max-w-[1750px] mx-auto items-center py-3 w-full">
      <!--<p class="mb-5 text-2xl font-medium text-gray-500 dark:text-gray-400 text-center">Stand 10.02.2023</p>-->
      <div class="flex flex-col gap-8 rounded-lg md:flex-row">
        <div id="übersichtMain" class="relative basis-1/2 shrink-0 target:scroll-mt-20">
          <h1 class="mb-5 text-2xl font-bold text-gray-500 dark:text-white">Gliederung</h1>
          <p class="w-full text-lg text-left text-gray-500 dark:text-gray-400">
            Die IfZ-Systematik bietet Ihnen in chronologischen und thematischen Gruppen einen strukturierten Zugang zu den Sammelgebieten der Bibliothek und zu den im Bibliothekskatalog verzeichneten Teilen des Archivbestandes. Mit den Notationen der IfZ-Systematik können Sie im Online-Katalog im Suchfeld <a href="https://opac.ifz-muenchen.de/webOPACClient.ifzsis/start.do" target="blank" class="font-semibold text-gray-900 underline dark:text-white decoration-sky-500">IfZ-Systematik</a> Literaturrecherchen starten. Die Notationen bestehen aus Buchstaben-ZahlenKürzeln, nach dem/den Buchstaben folgt immer ein Leerzeichen/Blank.
          </p>
          <div class="mt-5 my-1 flex flex-row gap-4 flex-wrap items-center mx-auto">
            <button type="button" class="text-white bg-gradient-to-r from-blue-500 via-blue-600 to-blue-700 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-blue-300 dark:focus:ring-blue-800 shadow-lg shadow-blue-500/50 dark:shadow-lg dark:shadow-blue-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2 ">Alphabetisch</button>
            <button type="button" class="text-white bg-gradient-to-r from-cyan-400 via-cyan-500 to-cyan-600 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-cyan-300 dark:focus:ring-cyan-800 shadow-lg shadow-cyan-500/50 dark:shadow-lg dark:shadow-cyan-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">Sachgruppen</button>
            <button type="button" class="text-white bg-gradient-to-r from-purple-500 via-purple-600 to-purple-700 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-purple-300 dark:focus:ring-purple-800 shadow-lg shadow-purple-500/50 dark:shadow-lg dark:shadow-purple-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">Chronologisch</button>
            <div id="currentTab" class="grow text-right text-gray-500 dark:text-white">alphabetisch</div>
          </div>
          <div class="shadow-md sm:rounded-lg">
            <table class="table-fixed w-full text-lg text-left text-gray-500 dark:text-gray-400">
              <thead class="text-xs text-gray-700 uppercase bg-blue-200 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                  <th scope="col" class="px-3 py-2 w-3/12 md:w-1/6">Notation</th>
                  <th scope="col" class="px-3 py-2">Benennung</th>
                  <!--<th scope="col" class="px-3 py-2">Stichwort</th>-->
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="children/node">
                  <xsl:if test="not(contains(@notation, 'D') or contains(@notation, 'ZG'))">
                    <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-blue-100 dark:hover:bg-gray-600">
                      <td class="px-3 py-2 font-semibold text-gray-900 whitespace-nowrap dark:text-white"><a href="#{@notation}"><xsl:value-of select="@notation"/></a></td>
                      <td class="px-3 py-2"><xsl:value-of select="@benennung"/></td>
                      <!--<td class="px-3 py-2"><xsl:value-of select="content/stichwort"/></td>-->
                    </tr>
                  </xsl:if>
                </xsl:for-each>
              </tbody>
            </table>
          </div>
        </div>
        <div id="übersichtAnhänge" class="flex flex-col gap-8">
          <div>
            <h1 class="mb-5 text-2xl font-bold text-gray-500 dark:text-white">Amts-, Partei- und Verbandsdruckschriften im IfZ-Archiv</h1>
            <p class="w-full text-lg text-left text-gray-500 dark:text-gray-400">
              Folgende Anhänge zur Systematik der Bibliothek verzeichnen die Provenienzen der
              im Online-Katalog recherchierbaren Bestände der <a href="https://www.ifz-muenchen.de/das-archiv/recherche-im-archivgut/druckschriftensuche" target="blank" class="font-semibold text-gray-900 underline dark:text-white decoration-sky-500">Druckschriften-Sammlung des Archivs</a>
              und der ihnen zugeordneten Zeitgeschichtlichen Sammlung.
              Sie sind jeweils eine Bestandsübersicht und kein vollständiges systematisches
              Organisationsschema:<br/><br/>
              Die Druckschriften-Sammlung <a href="#übersichtAnhang1" class="font-semibold text-gray-900 underline dark:text-white decoration-sky-500">Anhang 1</a> umfasst Amtsdruckschriften, also
              Veröffentlichungen von Behörden und sonstigen öffentlich-rechtlichen Einrichtungen
              einschließlich ihrer Gesetz- und Verordnungsblätter, sowie Publikationen von Parteien,
              politischen Vereinigungen und privatrechtlichen Verbänden, Gewerkschaften und anderen
              Organisationen des politischen, wirtschaftlichen und kulturellen Bereichs mit Jahrbüchern,
              Jahres- und Geschäftsberichten, Protokollen, Mitgliederzeitschriften, Rundschreiben,
              Pressediensten, Monographien und Serien.<br/>
              Sie enthält außerdem das Kleinschrifttum (Flugblätter, Aufrufe, Partei-Werbematerialien und
              sonstige Graue Literatur verschiedener Behörden, Parteien und Organisationen) der
              Zeitgeschichtlichen Sammlung <a href="#übersichtAnhang2" class="font-semibold text-gray-900 underline dark:text-white decoration-sky-500">Anhang 2</a>.
            </p>
          </div>
          <div id="übersichtAnhang1" class="relative target:scroll-mt-20">
            <h1 class="mb-5 text-2xl font-bold text-gray-500 dark:text-white">Anhang 1 - Druckschriftensammlung (Archiv)</h1>
            <div class="shadow-md sm:rounded-lg">
              <table class="table-fixed w-full text-lg text-left text-gray-500 dark:text-gray-400">
                <thead class="text-xs text-gray-700 uppercase bg-blue-200 dark:bg-gray-700 dark:text-gray-400">
                  <tr>
                    <th scope="col" class="px-3 py-2 w-3/12 md:w-1/6">Notation</th>
                    <th scope="col" class="px-3 py-2">Benennung</th>
                    <!--<th scope="col" class="px-3 py-2">Stichwort</th>-->
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="children/node">
                    <xsl:if test="contains(@notation, 'D')">
                      <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-blue-100 dark:hover:bg-gray-600">
                        <td class="px-3 py-2 font-semibold text-gray-900 whitespace-nowrap dark:text-white"><a href="#{@notation}"><xsl:value-of select="@notation"/></a></td>
                        <td class="px-3 py-2"><xsl:value-of select="substring-after(@benennung, 'des Archivs:')"/></td>
                        <!--<td class="px-3 py-2"><xsl:value-of select="content/stichwort"/></td>-->
                      </tr>
                    </xsl:if>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </div>
          <div id="übersichtAnhang2" class="relative target:scroll-mt-20">
            <h1 class="mb-5 text-2xl font-bold text-gray-500 dark:text-white">Anhang 2 - Zeitgeschichtliche Sammlung (Archiv)</h1>
            <div class="shadow-md sm:rounded-lg">
              <table class="table-fixed w-full text-lg text-left text-gray-500 dark:text-gray-400">
                <thead class="text-xs text-gray-700 uppercase bg-blue-200 dark:bg-gray-700 dark:text-gray-400">
                  <tr>
                    <th scope="col" class="px-3 py-2 w-3/12 md:w-1/6">Notation</th>
                    <th scope="col" class="px-3 py-2">Benennung</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="children/node">
                    <xsl:if test="contains(@notation, 'ZG')">
                      <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-blue-100 dark:hover:bg-gray-600">
                        <td class="px-3 py-2 font-semibold text-gray-900 whitespace-nowrap dark:text-white"><a href="#{@notation}"><xsl:value-of select="@notation"/></a></td>
                        <td class="px-3 py-2"><xsl:value-of select="substring-after(@benennung, 'des Archivs:')"/></td>
                      </tr>
                    </xsl:if>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div id="details">
        <h1 id="detailsTitle" class="mt-10 mb-5 text-2xl font-bold text-gray-500 dark:text-white">Details</h1>
        <xsl:for-each select="children/node">
          <div id="{@notation}" class="detailedNotation hidden target:block target:scroll-mt-20">
            <summary class="mb-5 text-sm text-gray-700 dark:text-gray-400 list-none">
              <h2 class="text-xl font-bold text-gray-500 dark:text-gray-300">
                <xsl:value-of select="@notation"/>
                &#160;<xsl:value-of select="@benennung"/>
              </h2>
            </summary>
            <div id="{@notation}Tables">
              <xsl:for-each select="children/node">
                <div class="relative mb-5 overflow-x-auto shadow-md sm:rounded-lg">
                  <table class="table-fixed w-full text-md text-left text-gray-500 dark:text-gray-400">
                    <caption class="px-3 py-5 text-lg font-semibold text-left text-gray-900 bg-blue-50 dark:text-white dark:bg-gray-800">
                      <xsl:value-of select="@notation"/> - <span><xsl:value-of select="@benennung"/></span>
                    </caption>
                    <thead class="text-gray-700 text-sm uppercase bg-blue-200 dark:bg-gray-700 dark:text-gray-400">
                      <tr>
                        <th scope="col" class="px-3 py-2 w-3/12 md:w-1/12">Notation</th>
                        <th scope="col" class="px-3 py-2">
                          Benennung
                          <br/>
                          <span class="text-xs">Bemerkung</span>
                        </th>
                      </tr>
                    </thead>
                    <tbody class="">
                      <xsl:for-each select="children/node">
                        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-blue-100 dark:hover:bg-gray-600">
                          <th scope="row" class="px-3 py-2 font-medium underline text-gray-900 whitespace-nowrap dark:text-white">
                            <a id="{@notation}" target="_new" href="https://opac.ifz-muenchen.de/cgi-bin/search?ifzsys={@notation}"><xsl:value-of select="@notation"/></a>
                          </th>
                          <td class="px-3 py-2">
                            <span id="{@notation}-benennung"><xsl:value-of select="@benennung"/></span>
                            <br/>
                            <xsl:choose>
                              <xsl:when test="contains(content/@bemerkung, 'vgl. ') or contains(content/@bemerkung, 's. ') or contains(content/@bemerkung, 'siehe: ')">
                                <span class="text-sm addLinkToInlineNotation">
                                  <xsl:value-of select="content/@bemerkung"/>
                                </span> 
                              </xsl:when>
                              <xsl:otherwise>
                                <span class="text-sm">
                                  <xsl:value-of select="content/@bemerkung"/>
                                </span> 
                              </xsl:otherwise>
                            </xsl:choose>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </tbody>
                  </table>
                </div>
              </xsl:for-each>
            </div>
          </div>
        </xsl:for-each>
      </div>
    </div>

    <!-- Back to top button -->
    <div id="backToTop" class="fixed bottom-3 right-3">
      <button class="relative inline-flex items-center justify-center p-0.5 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-purple-600 to-blue-500 group-hover:from-purple-600 group-hover:to-blue-500 hover:text-white dark:text-white">
        <a href="#" class="relative px-2 py-1.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0">
          Zurück an Anfang
        </a>
      </button>
    </div>

    <!-- Help menu dial -->
    <div id="helpDial" class="fixed md:top-24 top-0 right-10 group z-20 px-5 backdrop-blur-md rounded-xl">
      <button id="helpDialButton" class="fixed top-1 right-1 flex items-center justify-center text-white bg-gradient-to-br from-purple-600 to-blue-500 rounded-full w-14 h-14 group-hover:from-purple-600 group-hover:to-blue-500">
        <svg aria-hidden="true" class="w-8 h-8" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M6 10a2 2 0 11-4 0 2 2 0 014 0zM12 10a2 2 0 11-4 0 2 2 0 014 0zM16 12a2 2 0 100-4 2 2 0 000 4z"></path></svg>
      </button>
      <div id="helpDialMenu" class="grid gap-x-4 items-center mt-4 space-y-2 hidden">
        <button class="col-span-2 relative w-[52px] h-[32px] text-black font-medium dark:text-white -left-1">Taste</button>
        <button id="strg-button" class="w-[52px] h-[52px] text-black bg-white rounded-xl border border-gray-200 dark:border-gray-600 shadow-sm dark:text-white dark:bg-gray-700">Strg</button>
        <p class="text-gray-500 dark:text-gray-400">Suchen</p>
        <button id="s-button" class="w-[52px] h-[52px] text-black bg-white rounded-xl border border-gray-200 dark:border-gray-600 shadow-sm dark:text-white dark:bg-gray-700">S</button>
        <p class="text-gray-500 dark:text-gray-400">Suchergebnisse</p>
        <button id="esc-button" class="w-[52px] h-[52px] text-black bg-white rounded-xl border border-gray-200 dark:border-gray-600 shadow-sm dark:text-white dark:bg-gray-700">Esc</button>
        <p class="text-gray-500 dark:text-gray-400">Zum Anfang</p>
        <button id="d-button" class="w-[52px] h-[52px] text-black bg-white rounded-xl border border-gray-200 dark:border-gray-600 shadow-sm dark:text-white dark:bg-gray-700">D</button>
        <p class="text-gray-500 dark:text-gray-400">Anhang 1</p>
        <button id="z-button" class="w-[52px] h-[52px] text-black bg-white rounded-xl border border-gray-200 dark:border-gray-600 shadow-sm dark:text-white dark:bg-gray-700">Z</button>
        <p class="text-gray-500 dark:text-gray-400">Anhang 2</p>
        <button id="m-button" class="w-[52px] h-[52px] text-black bg-white rounded-xl border border-gray-200 dark:border-gray-600 shadow-sm dark:text-white dark:bg-gray-700">M</button>
        <p class="text-gray-500 dark:text-gray-400">Hell/Dunkel umschalten</p>
        <br/>
      </div>
    </div>

    <!-- Search results content -->
    <div id="searchResults" class="max-w-[1750px] h-full w-screen mx-auto items-center py-3 target:scroll-mt-20">

      <div id="searchResultsSystematik" class="mb-5 hidden">
        <h1 id="searchResultsSystematikTitle" class="mb-5 text-2xl font-bold text-gray-500 dark:text-white">Ergebnisse in Systematik</h1>
        <table id="searchResultsSystematikTable" class="table-fixed w-full text-md text-left text-gray-500 dark:text-gray-400">
          <thead class="text-sm text-gray-700 uppercase bg-blue-200 dark:bg-gray-700 dark:text-gray-400">
            <tr>
              <th scope="col" class="px-3 py-2 w-3/12 md:w-1/12">Notation</th>
              <th scope="col" class="px-3 py-2">
                Benennung
                <br/>
                <span class="text-xs">Bemerkung</span>
              </th>
            </tr>
          </thead>
          <tbody id="searchResultsSystematikTableBody"></tbody>
        </table>
      </div>

      <div id="searchResultsNotation" class="mb-5 hidden">
        <h1 id="searchResultsNotationTitle" class="mb-5 text-2xl font-bold text-gray-500 dark:text-white">Ergebnisse in Notation</h1>
        <table id="searchResultsNotationTable" class="table-fixed w-full text-md text-left text-gray-500 dark:text-gray-400">
          <thead class="text-sm text-gray-700 uppercase bg-blue-200 dark:bg-gray-700 dark:text-gray-400">
            <tr>
              <th scope="col" class="px-3 py-2 w-3/12 md:w-1/12">Notation</th>
              <th scope="col" class="px-3 py-2">
                Benennung
                <br/>
                <span class="text-xs">Bemerkung</span>
              </th>
            </tr>
          </thead>
          <tbody id="searchResultsNotationTableBody"></tbody>
        </table>
      </div>

    </div>

    <!-- JS imports -->
    <script src="sys.js" type="module"></script>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
