<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" encoding="utf-8" indent="yes" />

<xsl:template match="/IfZ-Systematik">
  <!--<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>-->
  <html id="html" class="dark">
  <script>
    if (localStorage.getItem('darkMode') === 'off') {
      document.querySelector('#html').classList.remove('dark');
    }
  </script>
  <style>
    thead:has(+ tbody:empty)  {
      display: none;
    }
  </style>
  <head>  
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link href="tailwind.css" rel="stylesheet"></link>
    <link href="img/favicon.ico" rel="icon" type="image/x-icon"></link>
    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;400;600;700" rel="stylesheet"></link>

    <title>IfZ Systematik</title>
  </head>
  <body class="bg-ifz-lightmode-background dark:bg-ifz-darkmode-background">

    <!-- Navigation bar -->
    <nav class="sticky bg-ifz-lightmode-table-background border-ifz-dark-blue py-3 z-20 top-0 left-0 border-b dark:bg-ifz-darkmode-table-background dark:border-ifz-dark-blue">
      <div class="max-w-[1750px] px-3 flex flex-wrap items-center justify-center mx-auto">
        <a href="https://ifz-muenchen.de/">
          <img src="img/logo_light.svg" class="block dark:hidden mr-3 h-16" alt="IfZ Logo"/>
          <img src="img/logo_dark.svg" class="hidden dark:block mr-3 h-16" alt="IfZ Logo"/>
        </a>
        <div class="grow text-center">
          <a href="./sys.xml" class="text-ifz-text-dark text-4xl font-semibold dark:text-ifz-text-white">Systematik</a>
        </div>
        <div class="my-3 self-center min-w-[350px]">
          <div class="relative block">
            <button id="searchIcon" class="absolute inset-y-0 left-0 flex items-center pl-2">
              <svg class="w-8 h-8 text-ifz-text-dark-gray dark:text-ifz-text-white" aria-hidden="true" fill="currentColor" viewBox="0 0 25 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
            </button>
            <input type="text" id="search-navbar" class="w-full block p-2 pl-10 text-2xl rounded-lg text-ifz-text-dark-gray dark:text-ifz-text-light-gray bg-ifz-lightmode-background dark:bg-ifz-darkmode-background border-2 dark:border-0 border-ifz-text-dark-gray dark:border-ifz-text-white" placeholder="Systematik durchsuchen..."/>
          </div>
        </div>
      </div>
    </nav>

    <!-- Main page content -->
    <div id="pageMain" class="max-w-[1750px] mx-auto items-center p-3">
      <div id="overview" class="flex flex-col gap-8 rounded-lg lg:flex-row">
        <div id="übersichtMain" class="relative basis-1/2 shrink-0 target:scroll-mt-24">
          <h1 class="mb-5 text-2xl font-bold text-ifz-text-dark-gray dark:text-ifz-text-white">Übersicht über die IfZ-Systematik</h1>
          <p class="w-full text-lg text-justify text-ifz-text-dark-gray dark:text-ifz-text-light-gray">
            Die IfZ-Systematik bietet Ihnen in chronologischen und thematischen Gruppen einen strukturierten Zugang zu den <span class="font-semibold text-ifz-text-black dark:text-ifz-text-white decoration-ifz-dark-blue">Sammelgebieten der Bibliothek</span> und zu den im Bibliothekskatalog verzeichneten <span class="font-semibold text-ifz-text-black dark:text-ifz-text-white decoration-ifz-dark-blue">Teilen des Archivbestands</span>. Mit den Notationen der IfZ-Systematik können Sie im Online-Katalog im Suchfeld <a href="https://opac.ifz-muenchen.de/webOPACClient.ifzsis/start.do" target="blank" class="font-semibold text-ifz-text-black underline dark:text-ifz-text-white decoration-ifz-dark-blue">IfZ-Systematik</a> Literaturrecherchen starten. Die Notationen bestehen aus Buchstaben-Zahlen-Kürzeln, nach dem/den Buchstaben folgt immer ein Leerzeichen.<br/><br/>Die IfZ-Systematik umfasst weit über 6.000 Notationen und wird seit der Gründung der Bibliothek fortlaufend weiterentwickelt. Sie stellt das primäre Instrument der Inhaltserschließung an der IfZ-Bibliothek dar. Viele Literaturtitel, insbesondere Aufsätze aus Zeitschriften und Sammelbänden, sind ausschließlich oder hauptsächlich mittels der Systematik inhaltserschlossen. Aufgrund der über 70-jährigen Genese der Systematik entsprechen die Begrifflichkeit und die Strukturierung nicht immer den aktuellen Erwartungen.
          </p>
          <h1 id="mainHeadline" class="mt-5 text-2xl font-bold text-ifz-text-dark-gray dark:text-ifz-text-white">Systematik der Bibliothek</h1>
          <h2 id="mainLowHeadline" class="mb-5 text-1xl font-semibold text-ifz-text-dark-gray dark:text-ifz-text-white">von a bis x</h2>
          <div class="my-5 flex flex-row gap-6 flex-wrap items-center mx-auto">
            <button id="alpha-button" type="button" class="bg-ifz-lightmode-table-hover text-ifz-text-dark-gray dark:bg-ifz-darkmode-table-hover dark:text-ifz-text-white shadow-lg shadow-ifz-light-blue/50 dark:shadow-ifz-darkmode-table-hover/50 font-semibold rounded-lg text-md px-4 py-2.5 text-center mr-2 mb-2 grow ring-4">Systematisch</button>
            <button id="sach-button" type="button" class="bg-ifz-lightmode-table-hover text-ifz-text-dark-gray dark:bg-ifz-darkmode-table-hover dark:text-ifz-text-white shadow-lg shadow-ifz-light-blue/50 dark:shadow-ifz-darkmode-table-hover/50 font-semibold rounded-lg text-md px-4 py-2.5 text-center mr-2 mb-2 grow">Sachlich</button>
            <button id="chrono-button" type="button" class="bg-ifz-lightmode-table-hover text-ifz-text-dark-gray dark:bg-ifz-darkmode-table-hover dark:text-ifz-text-white shadow-lg shadow-ifz-light-blue/50 dark:shadow-ifz-darkmode-table-hover/50 font-semibold rounded-lg text-md px-4 py-2.5 text-center mr-2 mb-2 grow">Chronologisch</button>
            <div id="currentTab" class="hidden grow text-right text-ifz-text-black dark:text-ifz-text-white">Alphabetisch</div>
          </div>
          <div class="relative mb-5 overflow-x-auto rounded-lg">
            <table id="alphaMain" class="table-fixed w-full text-lg text-left text-ifz-text-dark-gray dark:text-ifz-text-light-gray">
              <thead class="text-xs text-ifz-text-dark uppercase bg-ifz-medium-blue dark:bg-ifz-dark-gray dark:text-ifz-text-light-gray">
                <tr>
                  <th scope="col" class="px-3 py-2 w-4/12 md:w-3/12">Notationen</th>
                  <th scope="col" class="px-3 py-2">Benennung</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="*">
                  <xsl:if test="not(contains(translate(name(), '_', ' '), 'D') or contains(translate(name(), '_', ' '), 'ZG'))">
                    <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                      <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
                      <td class="px-3 py-2"><xsl:value-of select="@Benennung"/></td>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
              </tbody>
            </table>
            <table id="chronoMain" class="hidden table-fixed w-full text-lg text-left text-ifz-text-dark-gray dark:text-ifz-text-light-gray">
              <thead class="text-xs text-ifz-text-dark uppercase bg-ifz-medium-blue dark:bg-ifz-dark-gray dark:text-ifz-text-light-gray">
                <tr>
                  <th scope="col" class="px-3 py-2 w-4/12 md:w-3/12">Notationen</th>
                  <th scope="col" class="px-3 py-2">Benennung</th>
                </tr>
              </thead>
              <tbody>
                <xsl:apply-templates select="b_1-99"/>
                <tr class="bg-ifz-lightmode-table-background h-7 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"></td>
                  <td class="px-3 py-2 font-bold">Deutsche Geschichte</td>
                </tr>
                <xsl:apply-templates select="f_101-199"/>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"></td>
                  <td class="px-3 py-2 font-semibold">Weimarer Republik 1918 - 1933</td>
                </tr>
                <xsl:apply-templates select="f_1-99"/>
                <xsl:apply-templates select="g_1-99"/>
                <xsl:apply-templates select="e_1-99"/>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"></td>
                  <td class="px-3 py-2 font-semibold">Drittes Reich 1933 - 1945</td>
                </tr>
                <xsl:apply-templates select="j_1-99"/>
                <xsl:apply-templates select="g_1-99"/>
                <xsl:apply-templates select="h_1-99"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Dd 001-093">Dd 001-093</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#e 1-99">e 1-99</a></td>
                  <td class="px-3 py-2">Nationalsozialismus, NSDAP</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Db 001-299">Db 001-299</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)</td>
                </tr>
                <xsl:apply-templates select="e_101-199"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Dc 001-099">Dc 001-099</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)</td>
                </tr>
                <xsl:apply-templates select="e_201-299"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Db 052">Db 052</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)</td>
                </tr>
                <xsl:apply-templates select="w_101-199"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Db 044">Db 044</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)</td>
                </tr>
                <xsl:apply-templates select="k_1-99"/>
                <xsl:apply-templates select="n_1-99"/>
                <xsl:apply-templates select="k_101-199"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#De 001-999">De 001-999</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)</td>
                </tr>
                <xsl:apply-templates select="h_101-199"/>
                <xsl:apply-templates select="l_101-199"/>
                <xsl:apply-templates select="w_201-299"/>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"></td>
                  <td class="px-3 py-2 font-semibold">Deutsche Geschichte seit 1945</td>
                </tr>
                <xsl:apply-templates select="x_1-99"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Dk 001-913">Dk 001-913</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#x 1-99">x 1-99</a></td>
                  <td class="px-3 py-2">Deutschlandpolitik, Innerdeutsche Beziehungen</td>
                </tr>
                <xsl:apply-templates select="x_101-199"/>
                <xsl:apply-templates select="x_201-299"/>
                <xsl:apply-templates select="x_301-399"/>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"></td>
                  <td class="px-3 py-2 font-semibold">Bundesrepublik Deutschland seit 1949</td>
                </tr>
                <xsl:apply-templates select="x_501-599"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Dm 001-999">Dm 001-999</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)</td>
                </tr>
                <xsl:apply-templates select="x_401-499"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Dm 001-999">Dm 001-999</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"></td>
                  <td class="px-3 py-2 font-semibold">Deutsche Demokratische Republik 1949 - 1990</td>
                </tr>
                <xsl:apply-templates select="x_601-699"/>
                <xsl:apply-templates select="x_401-499"/>
                <tr class="bg-ifz-lightmode-table-background h-7 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"></td>
                  <td class="px-3 py-2 font-bold">Internationale Beziehungen</td>
                </tr>
                <xsl:apply-templates select="c_1-199"/>
                <xsl:apply-templates select="q_501-599"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#f 101-199">f 101-199</a></td>
                  <td class="px-3 py-2">Deutsche Außenpolitik 1871 - 1918</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"></td>
                  <td class="px-3 py-2 font-semibold">Erster Weltkrieg 1914 - 1918</td>
                </tr>
                <xsl:apply-templates select="t_1-99"/>
                <xsl:apply-templates select="t_101-199"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Dj 001-999">Dj 001-999</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#g 1-99">g 1-99</a></td>
                  <td class="px-3 py-2 font-semibold">Internationale Beziehungen 1918 - 1939</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#g 1-99">g 1-99</a></td>
                  <td class="px-3 py-2">Deutsche Außenpolitik 1918 - 1939/45</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"></td>
                  <td class="px-3 py-2 font-semibold">Zweiter Weltkrieg 1939 - 1945</td>
                </tr>
                <xsl:apply-templates select="u_1-99"/>
                <xsl:apply-templates select="u_101-199"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Dj 001-999">Dj 001-999</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)</td>
                </tr>
                <xsl:apply-templates select="h_1-99"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Dd 001-913">Dd 001-913</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)</td>
                </tr>
                <xsl:apply-templates select="h_101-199"/>
                <xsl:apply-templates select="n_1-99"/>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="b_101-199"/>
                <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#x 401-499">x 401-499</a></td>
                  <td class="px-3 py-2">Deutsche Außenpolitik seit 1945</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Dm 001-999">Dm 001-999</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#x 401-499">x 401-499</a></td>
                  <td class="px-3 py-2">Deutschlandpolitik des Auslandes 1945 - 1990</td>
                </tr>
                <xsl:apply-templates select="c_201-299"/>
              </tbody>
            </table>
            <table id="sachMain" class="hidden table-fixed w-full text-lg text-left text-ifz-text-dark-gray dark:text-ifz-text-light-gray">
              <thead class="text-xs text-ifz-text-dark uppercase bg-ifz-medium-blue dark:bg-ifz-dark-gray dark:text-ifz-text-light-gray">
                <tr>
                  <th scope="col" class="px-3 py-2 w-4/12 md:w-3/12">Notationen</th>
                  <th scope="col" class="px-3 py-2">Benennung</th>
                </tr>
              </thead>
              <tbody>
                <xsl:apply-templates select="a_1-99"/>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#w 201-299">w 201-299</a></td>
                  <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Arbeitsdienst, Reichsarbeitsdienst</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="m_1-99"/>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="d_1-99"/>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="w_1-99"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Df 001-799">Df 001-799</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur bis 1945 (Druckschriften des Archivs)</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="n_101-199"/>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="b_201-299"/>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="m_201-299"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs">
                    <a class="text-xs" href="#Df 001-799">Df 001-799</a>
                    <br/>
                    <a class="text-xs" href="#Dq 001-887">Dq 001-887</a>
                    <br/>
                    <a class="text-xs" href="#Dj 001-999">Dj 001-999</a>
                    </td>
                  <td class="px-3 py-2 text-xs">
                    Gedruckte Quellen / Primärliteratur bis 1945 (Druckschriften des Archivs)
                    <br/>
                    Gedruckte Quellen / Primärliteratur ab 1945 (Druckschriften des Archivs)
                    <br/>
                    Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)
                  </td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="m_101-199"/>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#n 1-99">n 1-99</a></td>
                  <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Juden, Antisemitismus, Judenverfolgung</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Dj 001-999">Dj 001-999</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur bis 1945 (Druckschriften des Archivs)</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#w 101-199">w 101-199</a></td>
                  <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Jugend, Jugendorganisationen, Jugendbewegung</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs">
                    <a class="text-xs" href="#Df 001-799">Df 001-799</a>
                    <br/>
                    <a class="text-xs" href="#Dq 001-887">Dq 001-887</a>
                    </td>
                  <td class="px-3 py-2 text-xs">
                    Gedruckte Quellen / Primärliteratur bis 1945 (Druckschriften des Archivs)
                    <br/>
                    Gedruckte Quellen / Primärliteratur ab 1945 (Druckschriften des Archivs)
                  </td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="v_1-99"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs">
                    <a class="text-xs" href="#Df 001-799">Df 001-799</a>
                    <br/>
                    <a class="text-xs" href="#Dq 001-887">Dq 001-887</a>
                    </td>
                  <td class="px-3 py-2 text-xs">
                    Gedruckte Quellen / Primärliteratur bis 1945 (Druckschriften des Archivs)
                    <br/>
                    Gedruckte Quellen / Primärliteratur ab 1945 (Druckschriften des Archivs)
                  </td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="l_1-99"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Dj 001-999">Dj 001-999</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur bis 1945 (Druckschriften des Archivs)</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#l 101-199">l 101-199</a></td>
                  <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Medien und Propaganda 1933 - 1945</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="s_1-99"/>
                <xsl:apply-templates select="s_101-199"/>
                <xsl:apply-templates select="s_201-299"/>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#c 1-199">c 1-199</a></td>
                  <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Politikwissenschaft, Internationale Politik</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="p_1-99"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Dm 001-999">Dm 001-999</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur bis 1945 (Druckschriften des Archivs)</td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="o_1-99"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs">
                    <a class="text-xs" href="#Di 001-399">Di 001-399</a>
                    <br/>
                    <a class="text-xs" href="#Dj 001-999">Dj 001-999</a>
                    </td>
                  <td class="px-3 py-2 text-xs">
                    Gedruckte Quellen / Primärliteratur bis 1945 (Druckschriften des Archivs)
                    <br/>
                    Gedruckte Quellen / Primärliteratur ab 1945 (Druckschriften des Archivs)
                  </td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="r_1-99"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs">
                    <a class="text-xs" href="#Dg 001-999">Dg 001-999</a>
                    <br/>
                    <a class="text-xs" href="#Dj 001-999">Dj 001-999</a>
                    </td>
                  <td class="px-3 py-2 text-xs">
                    Gedruckte Quellen / Primärliteratur bis 1945 (Druckschriften des Archivs)
                    <br/>
                    Gedruckte Quellen / Primärliteratur ab 1945 (Druckschriften des Archivs)
                  </td>
                </tr>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="c_301-399"/>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="m_301-399"/>
                <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                <xsl:apply-templates select="q_1-99"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs">
                    <a class="text-xs" href="#Dg 001-999">Dg 001-999</a>
                    <br/>
                    <a class="text-xs" href="#Dj 001-999">Dj 001-999</a>
                    </td>
                  <td class="px-3 py-2 text-xs">
                    Gedruckte Quellen / Primärliteratur bis 1945 (Druckschriften des Archivs)
                    <br/>
                    Gedruckte Quellen / Primärliteratur ab 1945 (Druckschriften des Archivs)
                  </td>
                </tr>
                <xsl:apply-templates select="q_101-199"/>
                <xsl:apply-templates select="q_201-299"/>
                <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                  <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs"><a class="text-xs" href="#Dm 001-999">Dm 001-999</a></td>
                  <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur bis 1945 (Druckschriften des Archivs)</td>
                </tr>
                <xsl:apply-templates select="q_301-399"/>
                <xsl:apply-templates select="q_401-499"/>
              </tbody>
            </table>
          </div>
        </div>
        <div id="übersichtAnhänge" class="flex flex-col gap-8">
          <div class="mb-[28px]">
            <h1 class="mb-5 text-2xl font-bold text-ifz-text-dark-gray dark:text-ifz-text-white">Amts-, Partei- und Verbandsdruckschriften im IfZ-Archiv</h1>
            <p class="w-full text-lg text-justify text-ifz-text-dark-gray dark:text-ifz-text-light-gray">
              Folgende Anhänge zur Systematik der Bibliothek verzeichnen die Provenienzen der
              im Online-Katalog recherchierbaren Bestände der <a href="https://www.ifz-muenchen.de/das-archiv/recherche-im-archivgut/druckschriftensuche" target="blank" class="font-semibold text-ifz-text-black underline dark:text-ifz-text-white decoration-ifz-dark-blue">Druckschriften-Sammlung des Archivs</a>
              und der ihnen zugeordneten Zeitgeschichtlichen Sammlung.
              Sie sind jeweils eine Bestandsübersicht und kein vollständiges systematisches
              Organisationsschema:<br/><br/>
              Die Druckschriften-Sammlung <a href="#übersichtAnhang1" class="font-semibold text-ifz-text-black underline dark:text-ifz-text-white decoration-ifz-dark-blue">Anhang 1</a> umfasst Amtsdruckschriften, also
              Veröffentlichungen von Behörden und sonstigen öffentlich-rechtlichen Einrichtungen
              einschließlich ihrer Gesetz- und Verordnungsblätter, sowie Publikationen von Parteien,
              politischen Vereinigungen und privatrechtlichen Verbänden, Gewerkschaften und anderen
              Organisationen des politischen, wirtschaftlichen und kulturellen Bereichs mit Jahrbüchern,
              Jahres- und Geschäftsberichten, Protokollen, Mitgliederzeitschriften, Rundschreiben,
              Pressediensten, Monographien und Serien.<br/>
              Sie enthält außerdem das Kleinschrifttum (Flugblätter, Aufrufe, Partei-Werbematerialien und
              sonstige Graue Literatur verschiedener Behörden, Parteien und Organisationen) der
              Zeitgeschichtlichen Sammlung <a href="#übersichtAnhang2" class="font-semibold text-ifz-text-black underline dark:text-ifz-text-white decoration-ifz-dark-blue">Anhang 2</a>.
            </p>
          </div>
          <div id="übersichtAnhang1" class="relative target:scroll-mt-24">
            <h1 class="mb-5 text-2xl font-bold text-ifz-text-dark-gray dark:text-ifz-text-white">Anhang 1 - Druckschriftensammlung (Archiv)</h1>
            <div class="relative mb-5 overflow-x-auto rounded-lg">
              <table class="table-fixed w-full text-lg text-left text-ifz-text-dark-gray dark:text-ifz-text-light-gray">
                <thead class="text-xs text-ifz-text-dark uppercase bg-ifz-medium-blue dark:bg-ifz-dark-gray dark:text-ifz-text-light-gray">
                  <tr>
                    <th scope="col" class="px-3 py-2 w-4/12 md:w-3/12">Notationen</th>
                    <th scope="col" class="px-3 py-2">Benennung</th>
                    <!--<th scope="col" class="px-3 py-2">Stichwort</th>-->
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="*">
                    <xsl:if test="contains(translate(name(), '_', ' '), 'D')">
                      <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                        <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
                        <td class="px-3 py-2"><xsl:value-of select="substring-after(@Benennung, 'des Archivs:')"/></td>
                        <!--<td class="px-3 py-2"><xsl:value-of select="content/stichwort"/></td>-->
                      </tr>
                    </xsl:if>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </div>
          <div id="übersichtAnhang2" class="relative target:scroll-mt-24">
            <h1 class="mb-5 text-2xl font-bold text-ifz-text-dark-gray dark:text-ifz-text-white">Anhang 2 - Zeitgeschichtliche Sammlung (Archiv)</h1>
            <div class="relative mb-5 overflow-x-auto rounded-lg">
              <table id="alphaÜbersicht2" class="table-fixed w-full text-lg text-left text-ifz-text-dark-gray dark:text-ifz-text-light-gray">
                <thead class="text-xs text-ifz-text-dark uppercase bg-ifz-medium-blue dark:bg-ifz-dark-gray dark:text-ifz-text-light-gray">
                  <tr>
                    <th scope="col" class="px-3 py-2 w-4/12 md:w-3/12">Notationen</th>
                    <th scope="col" class="px-3 py-2">Benennung</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="*">
                    <xsl:if test="contains(translate(name(), '_', ' '), 'ZG')">
                      <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                        <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
                        <td class="px-3 py-2"><xsl:value-of select="substring-after(@Benennung, 'des Archivs:')"/></td>
                      </tr>
                    </xsl:if>
                  </xsl:for-each>
                </tbody>
              </table>
              <table id="chronoÜbersicht2" class="hidden table-fixed w-full text-lg text-left text-ifz-text-dark-gray dark:text-ifz-text-light-gray">
                <thead class="text-xs text-ifz-text-dark uppercase bg-ifz-medium-blue dark:bg-ifz-dark-gray dark:text-ifz-text-light-gray">
                  <tr>
                    <th scope="col" class="px-3 py-2 w-4/12 md:w-3/12">Notationen</th>
                    <th scope="col" class="px-3 py-2">Benennung</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"></td>
                    <td class="px-3 py-2 font-bold">Deutsche Geschichte</td>
                  </tr>
                  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"></td>
                    <td class="px-3 py-2">Deutschland 1871 - 1945</td>
                  </tr>
                  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs">
                      <br/>
                      <a class="text-xs" href="#ZGa 001-099">ZGa 001-099</a>
                      <br/>
                      <a class="text-xs" href="#ZGd 001-090">ZGd 001-090</a>
                      <br/>
                      <a class="text-xs" href="#ZGc 001-099">ZGc 001-099</a>
                      <br/>
                      <a class="text-xs" href="#ZGe 001-999">ZGe 001-999</a>
                      <br/>
                      <a class="text-xs" href="#ZGf 001-799">ZGf 001-799</a>
                      <br/>
                      <a class="text-xs" href="#ZGg 001-999">ZGg 001-999</a>
                      <br/>
                      <a class="text-xs" href="#ZGi 001-399">ZGi 001-399</a>
                      <br/>
                      <a class="text-xs" href="#ZGb 001-299">ZGb 001-299</a>
                    </td>
                    <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)
                      <br/>
                      Oberste Reichsbehörden
                      <br/>
                      Deutsche Länder, besetzte Gebiete
                      <br/>
                      Polizei und SS
                      <br/>
                      Parteien und Politische Gruppen
                      <br/>
                      Wissenschaft und Kultur
                      <br/>
                      Wirtschaft und Sozialpolitik
                      <br/>
                      Religion und Weltanschauung
                      <br/>
                      Nationalsozialismus, NSDAP
                    </td>
                  </tr>
                  <xsl:apply-templates select="ZGk_001-913"/>
                  <tr class="bg-ifz-lightmode-table-background h-7 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"></td>
                    <td class="px-3 py-2 font-bold">Internationale Beziehungen</td>
                  </tr>
                  <xsl:apply-templates select="ZGj_001-999"/>
                  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#ZGk 001-913">ZGk 001-913</a></td>
                    <td class="px-3 py-2">	Deutschland als Besatzungsgebiet 1945 - 1949, Alliierte Einrichtungen bis 1955</td>
                  </tr>
                </tbody>
              </table>
              <table id="sachÜbersicht2" class="hidden table-fixed w-full text-lg text-left text-ifz-text-dark-gray dark:text-ifz-text-light-gray">
                <thead class="text-xs text-ifz-text-dark uppercase bg-ifz-medium-blue dark:bg-ifz-dark-gray dark:text-ifz-text-light-gray">
                  <tr>
                    <th scope="col" class="px-3 py-2 w-4/12 md:w-3/12">Notation</th>
                    <th scope="col" class="px-3 py-2">Benennung</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#ZGf 001-799">ZGf 001-799</a></td>
                    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Erziehung und Bildung, Wissenschaftsgeschichte</td>
                  </tr>
                  <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#ZGf 001-799">ZGf 001-799</a></td>
                    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Geschlechtergeschichte (Frauen, Männer, Familie)</td>
                  </tr>
                  <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#ZGf 001-799">ZGf 001-799</a></td>
                    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Jugend, Jugendorganisationen, Jugendbewegung</td>
                  </tr>
                  <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#ZGf 001-799">ZGf 001-799</a></td>
                    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Kultur- und Geistesgeschichte, Wissenschaft</td>
                  </tr>
                  <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#ZGf 001-799">ZGf 001-799</a></td>
                    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Medien</td>
                  </tr>
                  <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#ZGf 001-799">ZGf 001-799</a></td>
                    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Religion und Kirchen</td>
                  </tr>
                  <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#ZGf 001-799">ZGf 001-799</a></td>
                    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Sozialpolitik, Gewerkschaften, Arbeit</td>
                  </tr>
                  <tr class="bg-ifz-lightmode-table-background h-5 dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover"/>
                  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#ZGf 001-799">ZGf 001-799</a></td>
                    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Wirtschaft</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div id="details" class="mt-10 mb-5">
        <!--<h1 id="detailsTitle" class="mt-10 mb-5 text-2xl font-bold text-ifz-text-dark-gray dark:text-ifz-text-white">Details</h1>-->
        <xsl:for-each select="*">
          <div id="{translate(name(), '_', ' ')}" class="detailedNotation hidden target:block target:scroll-mt-24">
            <summary class="mb-5 text-sm text-ifz-text-dark dark:text-ifz-text-light-gray list-none">
              <h2 class="text-xl font-bold text-ifz-text-dark-gray dark:text-ifz-text-light-gray">
                <xsl:value-of select="translate(name(), '_', ' ')"/>
                &#160;<span id="{translate(name(), '_', ' ')}-benennung"><xsl:value-of select="@Benennung"/></span>
              </h2>
            </summary>
            <div id="{translate(name(), '_', ' ')}Tables">
              <xsl:for-each select="*">
                <div class="relative mb-5 overflow-x-auto shadow-md rounded-lg">
                  <table class="table-fixed w-full text-md text-left text-ifz-text-dark-gray dark:text-ifz-text-light-gray">
                    <caption class="px-3 py-5 text-lg font-semibold text-left text-ifz-text-black bg-ifz-lightmode-table-background dark:text-ifz-text-white dark:bg-ifz-darkmode-table-background">
                      <xsl:value-of select="translate(name(), '_', ' ')"/> - <span id="{translate(name(), '_', ' ')}-benennung"><xsl:value-of select="@Benennung"/></span>
                    </caption>
                    <thead class="text-ifz-text-dark text-sm bg-ifz-medium-blue dark:bg-ifz-dark-gray dark:text-ifz-text-light-gray">
                      <tr>
                        <th scope="col" class="px-3 py-2 w-4/12 md:w-3/24">Notation</th>
                        <th scope="col" class="px-3 py-2">
                          Benennung
                          <br/>
                          <span class="text-xs">Bemerkung</span>
                        </th>
                      </tr>
                    </thead>
                    <tbody class="">
                      <xsl:for-each select="*">
                        <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
                          <th scope="row" class="px-3 py-2 font-medium underline text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white">
                            <a id="{translate(name(), '_', ' ')}" target="_new" href="https://opac.ifz-muenchen.de/cgi-bin/search?ifzsys={translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a>
                          </th>
                          <td class="px-3 py-2">
                            <span id="{translate(name(), '_', ' ')}-benennung"><xsl:value-of select="@Benennung"/></span>
                            <br/>
                            <xsl:choose>
                              <xsl:when test="contains(@Bemerkungen, 'vgl. ') or contains(@Bemerkungen, 's. ') or contains(@Bemerkungen, 'siehe: ')">
                                <span class="text-sm addLinkToInlineNotation">
                                  <xsl:value-of select="@Bemerkungen"/>
                                </span> 
                              </xsl:when>
                              <xsl:otherwise>
                                <span class="text-sm">
                                  <xsl:value-of select="@Bemerkungen"/>
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
    <div id="backToTop" class="fixed bottom-3 right-3 z-10">
      <button class="relative inline-flex items-center justify-center p-0.5 overflow-hidden text-sm font-semibold text-ifz-text-dark-gray dark:text-ifz-text-white rounded-lg group backdrop-blur-md border-2 border-ifz-lightmode-table-hover dark:border-ifz-darkmode-table-hover hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover backdrop-blur-md">
        <a href="#" class="relative px-2 py-1.5">Zurück an Anfang</a>
      </button>
    </div>

    <!-- Help menu dial -->
    <div id="helpDial" class="fixed md:top-28 top-0 right-3 group z-10 px-3 backdrop-blur-md rounded-xl">
      <button id="helpDialButton" class="fixed top-1 right-1 flex items-center justify-center border-2 border-ifz-lightmode-table-hover dark:border-ifz-darkmode-table-hover hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover text-ifz-text-dark-gray dark:text-ifz-text-white rounded-full w-10 h-10 md:w-14 md:h-14 backdrop-blur-md">
        <svg aria-hidden="true" class="w-8 h-8" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M6 10a2 2 0 11-4 0 2 2 0 014 0zM12 10a2 2 0 11-4 0 2 2 0 014 0zM16 12a2 2 0 100-4 2 2 0 000 4z"></path></svg>
      </button>
      <div id="helpDialMenu" class="grid gap-x-4 items-center mt-4 space-y-2 hidden">
        <button class="col-span-2 relative w-[52px] h-[32px] text-ifz-text-black font-medium dark:text-ifz-text-white -left-1">Taste</button>
        <button id="strg-button" class="w-[52px] h-[52px] text-ifz-text-black bg-ifz-lightmode-table-background rounded-xl border border-gray-200 dark:border-gray-600 shadow-sm dark:text-ifz-text-white dark:bg-ifz-dark-gray">Alt Gr</button>
        <p class="text-ifz-text-dark-gray dark:text-ifz-text-light-gray">Suchen</p>
        <button id="s-button" class="w-[52px] h-[52px] text-ifz-text-black bg-ifz-lightmode-table-background rounded-xl border border-gray-200 dark:border-gray-600 shadow-sm dark:text-ifz-text-white dark:bg-ifz-dark-gray">S</button>
        <p class="text-ifz-text-dark-gray dark:text-ifz-text-light-gray">Suchergebnisse</p>
        <button id="esc-button" class="w-[52px] h-[52px] text-ifz-text-black bg-ifz-lightmode-table-background rounded-xl border border-gray-200 dark:border-gray-600 shadow-sm dark:text-ifz-text-white dark:bg-ifz-dark-gray">Esc</button>
        <p class="text-ifz-text-dark-gray dark:text-ifz-text-light-gray">Zum Anfang</p>
        <button id="d-button" class="w-[52px] h-[52px] text-ifz-text-black bg-ifz-lightmode-table-background rounded-xl border border-gray-200 dark:border-gray-600 shadow-sm dark:text-ifz-text-white dark:bg-ifz-dark-gray">D</button>
        <p class="text-ifz-text-dark-gray dark:text-ifz-text-light-gray">Anhang 1</p>
        <button id="z-button" class="w-[52px] h-[52px] text-ifz-text-black bg-ifz-lightmode-table-background rounded-xl border border-gray-200 dark:border-gray-600 shadow-sm dark:text-ifz-text-white dark:bg-ifz-dark-gray">Z</button>
        <p class="text-ifz-text-dark-gray dark:text-ifz-text-light-gray">Anhang 2</p>
        <button id="h-button" class="w-[52px] h-[52px] text-ifz-text-black bg-ifz-lightmode-table-background rounded-xl border border-gray-200 dark:border-gray-600 shadow-sm dark:text-ifz-text-white dark:bg-ifz-dark-gray">H</button>
        <p class="text-ifz-text-dark-gray dark:text-ifz-text-light-gray">Nutzungshinweise einblenden</p>
        <button id="m-button" class="w-[52px] h-[52px] text-ifz-text-black bg-ifz-lightmode-table-background rounded-xl border border-gray-200 dark:border-gray-600 shadow-sm dark:text-ifz-text-white dark:bg-ifz-dark-gray">M</button>
        <p class="text-ifz-text-dark-gray dark:text-ifz-text-light-gray">Hell/Dunkel umschalten</p>
        <br/>
      </div>
    </div>

    <!-- Search results content -->
    <div id="searchResults" class="max-w-[1750px] mx-auto items-center p-3 target:scroll-mt-24">

      <div id="searchResultsNotation" class="mb-5 hidden">
        <h1 id="searchResultsNotationTitle" class="mb-5 text-2xl font-bold text-ifz-text-dark-gray dark:text-ifz-text-white">Suchergebnisse für <span id="ergebnisHeadline" class="text-ifz-dark-blue">blank</span></h1>
        <h1 id="searchResultsNothing" class="hidden mb-5 text-xl font-semibold text-ifz-text-dark-gray dark:text-ifz-text-white">Keine Ereignisse gefunden</h1>
        <div class="relative mb-5 overflow-x-auto shadow-md rounded-lg">
          <table id="searchResultsNotationTable" class="table-fixed w-full text-md text-left text-ifz-text-dark-gray dark:text-ifz-text-light-gray">
            <thead class="text-sm text-ifz-text-dark bg-ifz-medium-blue dark:bg-ifz-dark-gray dark:text-ifz-text-light-gray">
              <tr>
                <th scope="col" class="px-3 py-2 w-4/12 md:w-3/24">Notation</th>
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

    </div>
    
    <!-- Nutzungshinweise -->
    <div id="nutzungshinweiseDiv" class="hidden flex items-center h-screen justify-center fixed inset-0 pointer-events-none backdrop-blur-xl z-10">
      <!--<img class="max-w-[250px] bg-transparent rounded-xl absolute top-12 right-[23%] rotate-90 z-30" src="./img/arrow.png" alt="Pfeil zum Suchfeld"/>-->
      <div class="max-w-[750px] m-12 p-12 rounded-xl border-2 dark:border-ifz-lightmode-table-border border-ifz-darkmode-table-border">
        <p class="text-center text-xl text-ifz-text-dark-gray dark:text-ifz-text-light-gray">
          Sie können über das Feld <strong class="text-semibold">Systematik durchsuchen</strong> in der Gesamtheit der Systematik suchen. Geben Sie dazu entweder eine Notation (z.B.: <strong class="font-semibold underline decoration-ifz-dark-blue">b 230.30.1</strong>) oder ein Schlagwort (z.B.: <strong class="font-semibold underline decoration-ifz-dark-blue">NSDAP</strong>) ein.
          <br class="mb-3"/>
          Eine Suche nach z.B.: <strong class="font-semibold underline decoration-ifz-dark-blue">x 1-8.2</strong> ist auch möglich; als Resultat werden alle Systematikpunkte von <strong class="font-semibold underline decoration-ifz-dark-blue">x 1</strong> bis <strong class="font-semibold underline decoration-ifz-dark-blue">x 8.2</strong> angezeigt.
          <br class="mb-3"/>
          Bei einer Schlagwortsuche können Sie auch mehrere Begriffe (getrennt durch ein Leerzeichen) miteinander kombinieren.
          <br class="mb-3"/>
          Die Groß-/Kleinschreibung wird ignoriert.
        </p>
      </div>
    </div>

    <!-- Nutzungshinweise Arrow -->
    <img id="nutzungshinweiseArrow" class="hidden max-w-[250px] max-h-[180px] bg-transparent rounded-xl fixed min-[1200px]:top-14 right-[31%] 2xl:right-[24%] min-[2200px]:right-[30%] rotate-90 z-30" src="./img/arrow.png" alt="Pfeil zum Suchfeld"/>

    <!-- Footer -->
    <footer class="mt-5 w-full">
      <div class="w-full mx-auto max-w-screen-xl flex justify-center">
        <ul class="flex flex-wrap items-center mt-3 text-sm font-medium text-ifz-text-dark-gray dark:text-ifz-text-light-gray sm:mt-0">
          <li><a href="./sys.xml" class="mr-4 hover:underline hover:decoration-ifz-dark-blue md:mr-6">Systematik</a></li>
          <li><button id="nutzungshinweiseButton" class="mr-4 hover:underline hover:decoration-ifz-dark-blue md:mr-6">Nutzungshinweise</button></li>
          <li><a href="./impressum.html" class="mr-4 hover:underline hover:decoration-ifz-dark-blue md:mr-6">Impressum</a></li>
          <li><a href="https://github.com/ifz-muenchen/IfZ-Systematik" class="hover:underline hover:decoration-ifz-dark-blue" target="_blank">Quellcode</a></li>
        </ul>
      </div>
      <div class="w-full mx-auto max-w-screen-xl flex justify-center my-2">
        <a rel="license" href="./impressum.html" target="_blank">
          <img src="https://licensebuttons.net/p/zero/1.0/80x15.png" alt="CC0" />
        </a>
      </div>
    </footer>

    <!-- JS imports -->
    <script src="sys.js" type="module"></script>
  </body>
  </html>
</xsl:template>

<xsl:template match="/IfZ-Systematik/*">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2"><xsl:value-of select="@Benennung"/></td>
  </tr>
</xsl:template>

<xsl:template match="//a_1-99">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Allgemeine Nachschlagewerke</td>
  </tr>
</xsl:template>

<xsl:template match="//d_1-99">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Deutsches Volk und Deutscher Raum, Auslandsdeutschtum</td>
  </tr>
</xsl:template>

<xsl:template match="//b_1-99">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2"><strong>Allgemeine Geschichte</strong> (Altertum, Mittelalter, Neuzeit)</td>
  </tr>
</xsl:template>

<xsl:template match="//g_1-99">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Außenpolitk</td>
  </tr>
</xsl:template>

<xsl:template match="//o_1-99">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Religion und Kirchen, Kirchenkampf</td>
  </tr>
</xsl:template>

<xsl:template match="//r_1-99">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Sozialpolitik: Arbeit und Soziales</td>
  </tr>
</xsl:template>

<xsl:template match="//q_1-99">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Wirtschaft</td>
  </tr>
</xsl:template>

<xsl:template match="//q_101-199">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Wirtschaft: Binnenhandel und Handwerk</td>
  </tr>
</xsl:template>

<xsl:template match="//q_201-299">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Wirtschaft: Finanzen</td>
  </tr>
</xsl:template>

<xsl:template match="//q_301-399">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Wirtschaft: Verkehr</td>
  </tr>
</xsl:template>

<xsl:template match="//q_401-499">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Wirtschaft: Landwirtschaft</td>
  </tr>
</xsl:template>

<xsl:template match="//v_1-99">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Kultur- und Geistesgeschichte, Wissenschaft (einzelne Disziplinen)</td>
  </tr>
</xsl:template>

<xsl:template match="//w_1-99">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Erziehung und Bildung, Wissenschaftsgeschichte</td>
  </tr>
</xsl:template>

<xsl:template match="//w_101-199">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Hitlerjugend</td>
  </tr>
</xsl:template>

<xsl:template match="//m_1-99">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Bevölkerungspolitik, Rassenpolitik</td>
  </tr>
</xsl:template>

<xsl:template match="//m_101-199">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Gesundheitswesen</td>
  </tr>
</xsl:template>

<xsl:template match="//m_201-299">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Geschlechtergeschichte (Frauen, Männer, Familie)</td>
  </tr>
</xsl:template>

<xsl:template match="//m_301-399">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Sport</td>
  </tr>
</xsl:template>

<xsl:template match="//k_1-99">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Verfolgung und Emigration</td>
  </tr>
</xsl:template>

<xsl:template match="//n_1-99">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Judenverfolgung</td>
  </tr>
</xsl:template>

<xsl:template match="//n_101-199">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Freimaurerei</td>
  </tr>
</xsl:template>

<xsl:template match="//k_101-199">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Widerstand in Deutschland</td>
  </tr>
</xsl:template>

<xsl:template match="//l_1-99">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Medien</td>
  </tr>
</xsl:template>

<xsl:template match="//p_1-99">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Recht, Verfassung, Verwaltung</td>
  </tr>
</xsl:template>

<xsl:template match="//l_101-199">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Medien und Propaganda</td>
  </tr>
</xsl:template>

<xsl:template match="//w_201-299">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Reichsarbeitsdienst</td>
  </tr>
</xsl:template>

<xsl:template match="//x_1-99">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Deutschland unter alliierter Besatzung 1945 - 1949</td>
  </tr>
</xsl:template>

<xsl:template match="//x_501-599">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Allgemein und Innenpolitik</td>
  </tr>
</xsl:template>

<xsl:template match="//x_401-499">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Außenpolitik</td>
  </tr>
</xsl:template>

<xsl:template match="//x_601-699">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Allgemein und Innenpolitik</td>
  </tr>
</xsl:template>

<xsl:template match="//c_1-199">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Internationale Politik</td>
  </tr>
</xsl:template>

<xsl:template match="//h_1-99">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2"><xsl:value-of select="@Benennung"/></td>
  </tr>
</xsl:template>

<xsl:template match="//e_101-199">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2"><xsl:value-of select="@Benennung"/></td>
  </tr>
</xsl:template>

<xsl:template match="//e_201-299">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2"><xsl:value-of select="@Benennung"/></td>
  </tr>
</xsl:template>

<xsl:template match="//h_101-199">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Widerstand gegen die deutsche Besatzung 1935 - 1945</td>
  </tr>
</xsl:template>

<xsl:template match="//s_1-99">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Militär</td>
  </tr>
</xsl:template>

<xsl:template match="//s_101-199">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Militär: Marine</td>
  </tr>
</xsl:template>

<xsl:template match="//s_201-299">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Militär: Luftwaffe</td>
  </tr>
</xsl:template>

<xsl:template match="//t_1-99">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Allgemein und Militärgeschichte</td>
  </tr>
</xsl:template>

<xsl:template match="//t_101-199">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Politische Geschichte</td>
  </tr>
</xsl:template>

<xsl:template match="//u_1-99">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Allgemein und Militärgeschichte</td>
  </tr>
</xsl:template>

<xsl:template match="//u_101-199">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Politische Geschichte</td>
  </tr>
</xsl:template>

<xsl:template match="//b_101-199">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 font-semibold">Internationale Beziehungen seit 1945</td>
  </tr>
</xsl:template>

<xsl:template match="//b_201-299">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Geschichtswissenschaft</td>
  </tr>
</xsl:template>

<xsl:template match="//c_201-299">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Europäische Integration seit 1945</td>
  </tr>
</xsl:template>

<xsl:template match="//c_301-399">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 first-letter:underline first-letter:font-semibold first-letter:decoration-ifz-dark-blue">Soziologie</td>
  </tr>
</xsl:template>

<xsl:template match="//ZGk_001-913">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Deutsche Behörden oberhalb der Länderebene bis zur Gründung der der Bundesrepublik Deutschland 1945 - 1949</td>
  </tr>
</xsl:template>

<xsl:template match="//ZGj_001-999">
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Ausländische Staaten und Einrichtungen, internationale Behörden und Organisationen bis Mai 1945</td>
  </tr>
</xsl:template>

<xsl:template match="//j_1-99">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Allgemein und Innenpolitik</td>
  </tr>
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs">
      <br/>
      <a class="text-xs" href="#Da 001-099">Da 001-099</a>
      <br/>
      <a class="text-xs" href="#Dc 001-099">Dc 001-099</a>
      <br/>
      <a class="text-xs" href="#Dd 001-093">Dd 001-093</a>
      <br/>
      <a class="text-xs" href="#De 001-999">De 001-999</a>
      <br/>
      <a class="text-xs" href="#Df 001-799">Df 001-799</a>
      <br/>
      <a class="text-xs" href="#Dg 001-999">Dg 001-999</a>
      <br/>
      <a class="text-xs" href="#Di 001-399">Di 001-399</a>
    </td>
    <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)
      <br/>
      Oberste Reichsbehörden
      <br/>
      Polizei
      <br/>
      Deutsche Länder
      <br/>
      Parteien und Politische Gruppen
      <br/>
      Wissenschaft und Kultur
      <br/>
      Wirtschaft und Sozialpolitik
      <br/>
      Religion und Weltanschauung
    </td>
  </tr>
</xsl:template>

<xsl:template match="//e_1-99">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Nationalsozialismus vor 1933</td>
  </tr>
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs">
      <a class="text-xs" href="#Db 001-299">Da 001-299</a>
      <br/>
      <a class="text-xs" href="#Dc 001-099">Dc 001-099</a>
    </td>
    <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)
      <br/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="//f_1-99">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2">Allgemein und Innenpolitik</td>
  </tr>
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs">
      <br/>
      <a class="text-xs" href="#Da 001-099">Da 001-099</a>
      <br/>
      <a class="text-xs" href="#Dc 001-099">Dc 001-099</a>
      <br/>
      <a class="text-xs" href="#Dd 001-093">Dd 001-093</a>
      <br/>
      <a class="text-xs" href="#De 001-999">De 001-999</a>
      <br/>
      <a class="text-xs" href="#Df 001-799">Df 001-799</a>
      <br/>
      <a class="text-xs" href="#Dg 001-999">Dg 001-999</a>
      <br/>
      <a class="text-xs" href="#Di 001-399">Di 001-399</a>
    </td>
    <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)
      <br/>
      Oberste Reichsbehörden
      <br/>
      Polizei
      <br/>
      Deutsche Länder
      <br/>
      Parteien und Politische Gruppen
      <br/>
      Wissenschaft und Kultur
      <br/>
      Wirtschaft und Sozialpolitik
      <br/>
      Religion und Weltanschauung
    </td>
  </tr>
</xsl:template>

<xsl:template match="//f_101-199">
  <tr class="bg-ifz-lightmode-table-background dark:bg-ifz-darkmode-table-background hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white"><a href="#{translate(name(), '_', ' ')}"><xsl:value-of select="translate(name(), '_', ' ')"/></a></td>
    <td class="px-3 py-2 font-semibold">Kaiserreich 1871 - 1918</td>
  </tr>
  <tr class="bg-ifz-lightmode-table-background border-b dark:bg-ifz-darkmode-table-background border-ifz-lightmode-table-border dark:border-ifz-darkmode-table-border hover:bg-ifz-lightmode-table-hover dark:hover:bg-ifz-darkmode-table-hover">
    <td class="px-3 py-2 font-semibold text-ifz-text-black whitespace-nowrap dark:text-ifz-text-white text-xs">
      <br/>
      <a class="text-xs" href="#Da 001-099">Da 001-099</a>
      <br/>
      <a class="text-xs" href="#Dd 001-093">Dd 001-093</a>
      <br/>
      <a class="text-xs" href="#De 001-999">De 001-999</a>
      <br/>
      <a class="text-xs" href="#Df 001-799">Df 001-799</a>
      <br/>
      <a class="text-xs" href="#Dg 001-999">Dg 001-999</a>
      <br/>
      <a class="text-xs" href="#Di 001-399">Di 001-399</a>
    </td>
    <td class="px-3 py-2 text-xs">Gedruckte Quellen / Primärliteratur (Druckschriften des Archivs)
      <br/>
      Oberste Reichsbehörden
      <br/>
      Deutsche Länder
      <br/>
      Parteien und Politische Gruppen
      <br/>
      Wissenschaft und Kultur
      <br/>
      Wirtschaft und Sozialpolitik
      <br/>
      Religion und Weltanschauung
    </td>
  </tr>
</xsl:template>

</xsl:stylesheet>
