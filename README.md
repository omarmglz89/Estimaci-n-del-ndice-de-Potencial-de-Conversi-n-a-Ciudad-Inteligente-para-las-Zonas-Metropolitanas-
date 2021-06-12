# IPPCI_ZM_2014-2020

## Pertinencia del proyecto:
La innovación juega un papel central en el desarrollo regional, no sólo en la formulación de políticas públicas, sino en su ejecución misma. En esa línea, es innegable que las soluciones tecnológicas que actualmente se encuentran disponibles a nivel mundial impactan positivamente en diversos ámbitos que van desde la productividad hasta la planificación urbana. Precisamente el término ciudad inteligente, pese a que existen diversas propuestas para su definición, en general busca explicar el papel que las TIC juegan en la atención y solución de problemas urbanos.

Es por tal razón, que el presente proyecto de investigación tiene como uno de sus objetivos principales proporcionar una definición de ciudad inteligente sobre la cual se evaluarán las capacidades de las ciudades mexicanas para migrar hacia dicho modelo urbano.

## Relevancia del proyecto:
En México no se cuenta con un índice que aborde el concepto de ciudad inteligente como eje temático. 

Así entonces, este proyecto de investigación plantea la estimación del Índice de Potencial de Conversión a Ciudad Inteligente (IPCCI), cuyo objetivo prioritario consiste en calificar a las ciudades mexicanas en función de sus capacidades actuales para implementar una estrategia de conversión hacia una ciudad inteligente. Adicionalmente, el IPCCI busca servir como herramienta para identificar recomendaciones de política pública para la implementación de una estrategia de migración a ciudad inteligente en las ciudades que hayan demostrado tener mejores condiciones para ello.

## Disposición de la información:
El cálculo del IPCCI para cada uno de los años que comprende el periodo de estudio se llevó a cabo mediante la técnica de análisis factorial, haciéndose uso del software R Studio. 

Previo a hacer este cálculo, se construyó un archivo Excel con la información de cada una de las variables para las 74 ZM del país para cada año del periodo de estudio; estos archivos reciben la nomenclatura IPCCI_datos_20XXv2.xlsx.

Para cada año se corre una rutina en R Studio, misma que puede consultarse en los archivos con la siguiente nomenclatura: IPCCIXX_af.R.

Finalmente, tomando en cuenta los resultados obtenidos para el IPPCI en el año 2020, se lleva a cabo un ejercicio de estratificación siguiendo el método Dalenius-Hodges (Ver archivos IPCCI20_Dalenius.xlsx y Dalenius.R)

## Fuentes de información consultadas:
Las variables sugeridas en la composición del IPCCI primordialmente pueden ser consultadas en las siguientes fuentes de consulta:

•	Asociación Nacional de Universidades e Instituciones de Educación Superior (ANUIES): La ANUIES compila anualmente información estadística de la población escolar y del personal docente para los niveles de educación media superior y superior; además presenta el Catálogo de Programas de Estudio de Licenciatura y Posgrado de instituciones afiliadas a la ANUIES. La información proporcionada por la ANUIES se encuentra disponible desde el ciclo escolar 2010-2011 hasta el ciclo escolar 2019-2020.  
•	Censos Económicos 2009, 2014 y 2019: INEGI desarrolla cada cinco años este ejercicio, a partir del cual se recopila información estadística sobre todos los establecimientos productores de bienes, comercializadores de mercancías y prestadores de servicios a un alto nivel de detalle geográfico y sectorial.
•	Censo Nacional de Población y Vivienda 2010 y 2020: Este ejercicio elaborado por el INEGI, de periodicidad decenal, arroja información estadística en torno al perfil demográfico y socioeconómico de la población a nivel nacional, estatal, municipal y para localidades con 50 mil o más habitantes. Para efectos de esta investigación, resulta de gran interés el conjunto de datos referente a la disponibilidad de las TIC en las viviendas particulares.
•	Comisión Nacional Bancaria y de Valores: La Comisión Nacional Bancaria y de Valores (CNBV), publica periódicamente información referente al sector financiero en su micrositio denominado Portafolio de Información. 
•	Consejo Nacional de Población: El Consejo Nacional de Población (CONAPO) cuenta con la atribución definida en la Ley General de Población de llevar a cabo proyecciones orientadas a conocer la dinámica del crecimiento poblacional en el corto, mediano y largo plazo; el más reciente trabajo atendiendo dicha atribución se ve reflejado en las Proyecciones de la Población de México y de las Entidades Federativas, 2016-2015. 
•	INEGI-CNGMDT: Desde el año 2009, el INEGI ha venido realizando bienalmente este ejercicio estadístico, el cual busca medir el desempeño de las instituciones públicas de cada municipio y demarcación territorial de la Ciudad de México, en los ámbitos de seguridad pública, justicia municipal, agua potable, residuos sólidos urbanos y medioambiente. Para efectos de esta investigación, se hará énfasis en los módulos de “Administración Pública municipal” y “Seguridad Pública”; los cuales arrojan información para el cierre del año anterior que antecede al levantamiento censal.
•	INEGI-DENUE: El DENUE brinda datos de identificación y ubicación para más de 5 millones de unidades económicas; cuya consulta puede realizarse en función de su actividad económica de acuerdo con la clasificación SCIAN y su tamaño. 
•	Instituto Federal de Telecomunicaciones (IFT): El Banco de Información de Telecomunicaciones del IFT resulta de utilidad para esta investigación pues entre su repertorio de datos, puede consultarse información a nivel municipal relacionada con el servicio fijo y móvil de telefonía, así como del servicio fijo de acceso a internet. La información presentada para estos temas es mensual y data desde 2013 para las series relacionadas con la información de acceso a internet; y desde 2015 para el caso de la información de líneas de telefonía pública.
•	Secretariado del Ejecutivo del Sistema Nacional de Seguridad Pública: Mensualmente, este organismo publica información referente a incidencia delictiva en el país, comprendida como la presunta ocurrencia de delitos registrados en averiguaciones previas iniciadas o carpetas de investigación, mismos que fueron reportados por las Procuradurías de Justicia y Fiscalías Generales de las entidades federativas.
•	Sistema Nacional de Información de Cultura (SNIC): Operado por la Secretaría de Cultura, el SNIC tiene la función de compilar información útil para el diseño y planeación de políticas en materia cultural. Para efectos de esta investigación, resulta de gran interés el conjunto de datos referente a la disponibilidad de las TIC en las viviendas particulares, información que se encuentra disponible a nivel municipal para el año 2015.
•	Sistema Nacional de Información e Indicadores de Vivienda (SNIIV): La Comisión Nacional de Vivienda integra en el SNIIV información a nivel municipal en torno al inventario de vivienda disponible desde 2014 a la fecha.
•	Skyscraper: El portal de Skyscraper cuenta con una amplia base de datos conformada por información sobre más de 100 mil rascacielos para cerca de 7 mil ciudades a nivel mundial.
