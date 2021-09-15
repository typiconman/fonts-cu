# fonts-cu

Этот пакет предоставляет шрифты для церковнославянского и старославянского
языков, закодированные в Юникоде. Шрифты содержат все необходимые глифы
кириллицы и глаголицы, включенные в состав
[Юникода, версия 13.0](https://www.unicode.org/versions/Unicode13.0.0/),
а также необходимые OpenType фичи для поддержки лигатур и надстрочных знаков.

Фичи SIL Graphite более не поддерживаются. Если Вам нужны Graphite фичи, см.
[устаревший репозиторий](https://github.com/slavonic/fonts-cu-legacy).

Глифы латиницы включены насколько это необходимо для поддержки в программном
обеспечении, однако шрифты не предназначены для работы с латиницей и в них
отсутствуют необходимые подстановки и кернинг для латиницы (за исключением
шрифта Momomakh).

## Гарнитуры

Пакет предоставляет следующие гарнитуры:

* Ponomar Unicode — шрифт для работы с современными (богослужебными) церковнославянскими текстами. Также присутствуют буквы для молдавской (румынской) кириллицы и для алеутского и якутского языков. Шрифт повторяет гарнитуру из изданий Синодальной типографии начала XX в.

* Pochaevsk Unicode — шрифт воспроизводит гарнитуру, которая использовалась в изданиях Свято-Успенской Почаевской лавры в конце XIX века и затем в изданиях Свято-Троицкого монастыря в Джорданвилле, США, в XX в.

* Triodion Unicode — шрифт воспроизводит гарнитуру синодальных изданий начала XX в. Шрифт также предназначен для работы с церковнославянскими текстами синодальной эпохи. 

* Fedorovsk Unicode — шрифт повторяет гарнитуру московских изданий первопечатника Ивана Федорова и рассчитан для набора старопечатных богослужебных книг и современных старообрядческих и единоверческих изданий.

* Menaion Unicode — шрифт рассчитан для набора текста кириллических и глаголических рукописей периода устава (X-XV вв.).

* Monomakh Unicode — шрифт имеет стилизированное начертание под устав с элементами полуустава и предназначен для специалистов в области славянской истории и филологии.

* Shafarik — шрифт предназначен для набора старославянских и ранних церковнославянских текстов, как написанных кириллицей, так и глаголицей и поддерживает как круглую болгарскую глаголицу, так и угловатую хорватскую глаголицу. 

* Indiction Unicode — шрифт воспроизводит гарнитуру буквиц в дореволюционных церковнославянских изданиях Синодальной типографии.

* Vertograd Unicode — шрифт воспроизводит еще одну гарнитуру декоративных буквиц и заголовков, которая встречается в изданиях Синодальной типографии.

* Cathisma Unicode — шрифт воспроизводит гарнитуру, которая используется в изданиях XVIII-XX веков для заголовков.

* Oglavie Unicode — еще один заголовочный шрифт. Также встречается в дореволюционных синодальных изданиях.

* Pomorsky Unicode — шрифт воспроизводит начертание декоративных заголовков старообрядческих книг из Выговской пустыни.

## Установка

### Скомпилированные шрифты

Все шрифты можно загрузить с сайта
[Инициативной группы славянской информатики](https://sci.ponomar.net/ru/fonts.html).

### Компиляция из исходных кодов

Сбор шрифтов из исходных кодов требует следующих программ:

* [FontForge](https://github.com/fontforge/fontforge)
* [ttfautohint](https://www.freetype.org/ttfautohint/) -- для сбора веб-шрифтов
* [ttf2eot](https://github.com/fontello/ttf2eot) -- для сбора веб-шрифтов
* [sfnt2woff](https://github.com/kseo/sfnt2woff) -- для сбора веб-шрифтов
* [woff2_compress](https://github.com/google/woff2) -- для сбора веб-шрифтов
* XeTeX с пакетом [churchslavonic](https://www.ctan.org/pkg/churchslavonic) -- для сбора документации в формате PDF

Чтобы собрать шрифты:

```
make fonts
```

Чтобы собрать документацию:

```
make doc
```

Чтобы собрать пакет целиком:

```
make all
```

Чтобы собрать web шрифты:

```
make web
```

## Лицензия

Copyright 2013-2020 Aleksandr Andreev and Nikita Simmons
([Инициативная группа славянской информатики](https://sci.ponomar.net/ru/)).
Шрифты являются свободным програмным обеспечением и распространяются
согласно с условиями SIL Open Font License, версия 1.1.
Текст лицензии и часто задаваемые вопросы можно найти по адресу https://scripts.sil.org/OFL.