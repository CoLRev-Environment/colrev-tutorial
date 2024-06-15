# CoLRev demo

The goal of this repository on GitHub codespaces is to demonstrate the CoLRev workflow.
To use CoLRev for literature review projects (involving PDF documents), we recommend a local setup.

# 1. Init

To get started, simply type `colrev init` on the command line and press `Enter`

```
colrev init --help
```

`colrev init` initializes a new CoLRev project. With this operation, the directories and files, including the git history, are set up. For more information check the [documentation](https://colrev.readthedocs.io/en/latest/manual/problem_formulation/init.html).

**Notes:**

- Check out the folder scaffold being created on the left
- You can specify a particular [review type](https://colrev.readthedocs.io/en/latest/manual/problem_formulation/init.html) by running `colrev init --type REVIEW_TYPE`
- When starting the project, it is good practice to use the `data/data/paper.md` as a protocol
- You can always add `--help` to the following commands to display more information.

# 2. Search

To add records the `colrev search` command can be used.

```
colrev search
```

`colrev search --add` adds a SearchSource to the project settings and record metadata are retrieved. SearchSources keep track of the associated queries, as well as the search results files. CoLRev includes serveral types of SearchSources such as, for example, traditional database searches, API-based searches, or backward and forward searches. For more information check the [documentation](https://colrev.readthedocs.io/en/latest/manual/metadata_retrieval/search.html).

1. Add ACM Digital Library as our first search source:
```
colrev search --add colrev.acm_digital_library
```

ACM Digital Library can only be searched manually via a database search. Follow the instructions provided or go to the [search](https://dl.acm.org/action/doSearch?fillQuickSearch=false&target=advanced&expand=all&AllField=Title%3A%28microsourcing%29+OR+Abstract%3A%28microsourcing%29+OR+Keyword%3A%28microsourcing%29), select all records, click export, save the search query in `data/search/acm_digital_library_query.txt`, upload the export to `data/search/acm_digital_library.bib`, and press `Enter`.

2. Add AIS library as our second search source:

```
colrev search --add colrev.ais_library
```

Select SearchType API and paste the following as the search query to search for microsourcing in titles, abstracts, and keywords: `title:microsourcing OR abstract:microsourcing OR subject:microsourcing`


After the search, continue with the following commands:

```
colrev load
colrev prep
colrev dedupe
```

- In the `colrev load` operation, search results are added to the main records. Records from the search result files are identified based on unique origin IDs and added to the main records file (`data/records.bib`). For more information check the [documentation](https://colrev.readthedocs.io/en/latest/manual/metadata_retrieval/load.html).
- In the `colrev prep` operation, metadata quality of records is improved. Preparation procedures include general formatting rules, SearchSource-specific fixes, and cross-checks with metadata repositories and curated CoLRev repositories. For more information check the [documentation](https://colrev.readthedocs.io/en/latest/manual/metadata_retrieval/prep.html).
- In the `colrev dedupe` operation, duplicate records are identified and merged. The predecessors of a merged record can be identified through the colrev_origin list field in `data/records.bib`, enabling ex-post validation and offering the possibility to undo merges. For more information check the [documentation](https://colrev.readthedocs.io/en/latest/manual/metadata_retrieval/dedupe.html).

**Notes:**

- At this point it may be a good idea to check the state of your CoLRev repository via `colrev status`
- You can also use [litbaskets.io](https://litbaskets.io/) to search and use the Scopus export
- If you check the changes introduced by prep, you may recognize that local quality rules (specific to AIS content) were applied

# 3. Screen

The metadata prescreen refers to the inclusion or exclusion of records based on titles and abstracts (if available).

```
colrev prescreen
```

The main purpose of `colrev prescreen` is to reduce the number of records by excluding those that are clearly irrelevant to the review objectives. When in doubt, records can be retained (included provisionally) to decide in step 5, i.e., the screen based on full-text documents. For more information check the [documentation](https://colrev.readthedocs.io/en/latest/manual/metadata_prescreen.html).

Provide a short explanation of the prescreen and decide on inclusion/exclusion of each record based on the titles and abstracts displayed.

The step of PDF retrieval refers to the activities to acquire PDF documents (or documents in other formats) as well as to ascertain or improve their quality.

```
colrev pdfs
```

`colrev pdfs` ensures that PDF documents correspond to their associated metadata (no mismatches), that they are machine readable (OCR and semantically annotated), and that unnecessary materials (such as cover pages) are removed. For more information check the [documentation](https://colrev.readthedocs.io/en/latest/manual/pdf_retrieval.html).

You may need to collect some PDFs manually. For `colrev pdf-get-man` follow the instructions provided by `colrev` on the command line.

You may also need to manually prepare some PDFs via `colrev pdf-prep-man`.

The PDF screen refers to the final inclusion or exclusion of records based on PDF documents.

```
colrev screen
```

In `colrev screen`, screening criteria, which can be inclusion or exclusion criteria, are a means to making these decisions more transparent (e.g., in a PRISMA flow chart). Records are only included when none of the criteria is violated. For more information check the [documentation](https://colrev.readthedocs.io/en/latest/manual/pdf_screen.html).

Screening criteria can be added by providing a short name, defining an inclusion (i) or exclusion (e) criterion, and by providing a short explanation. After defining all screening criteria, each record will be screened against each criterion.

**Notes:**

- Both prescreen and screen can be split to distribute the workload among multiple researchers
- You can extract abstracts from the PDFs before the screen by running ``colrev screen --add_abstracts_from_tei``

# 4. Data

The last step corresponds to the data extraction, analysis and synthesis activities. Depending on the type of review, this step can involve very different activities and outcomes.

```
colrev data
```

In the colrev data operation, records transition from `rev_included` to `rev_synthesized`. The data analysis and synthesis can involve different activities (data endpoints). For more information check the [documentation](https://colrev.readthedocs.io/en/latest/manual/data/data.html).

1. The paper-md endpoint is added per default for most of the review types. It can be used to create a review protocol or a manuscript based on pandoc and csl citation styles.

2. Add a PRISMA chart as our second data endpoint (if it is not already in the [settings](/settings.json)):
```
colrev data --add colrev.prisma
```

The prisma endpoint generates a PRISMA flow chart based on the current state of the review.

3. Add a BiBTex export as our third data endpoint:
```
colrev data --add colrev.bibliography_export
```

The bibliography-export endpoint exports the records in different bibliographical formats, which can be useful when the team works with a particular reference manager.

# 5. Bonus Operations (Optional)

1. Update an existing search
2. Conduct a backward search
