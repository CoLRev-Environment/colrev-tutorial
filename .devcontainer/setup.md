# CoLRev demo

The goal of this repository on GitHub codespaces is to demonstrate the CoLRev workflow. To use CoLRev for literature review projects (involving PDF documents), we recommend a local setup.



# 1. Init

```
colrev init
```

This operation initializes a new CoLRev project. With this operation, the directories and files, including the git history, are set up. For more information check the [documentation](https://colrev.readthedocs.io/en/latest/manual/problem_formulation/init.html).

**Steps:**

Simply type `colrev init` and press `Enter`

**Notes:**

- Check out the folder scaffold being created on the left
- You can specify a particular [review type](https://colrev.readthedocs.io/en/latest/manual/problem_formulation/init.html) by running `colrev init --type REVIEW_TYPE`
- When starting the project, it is good practice to use the `data/data/paper.md` as a protocol

<!-- There doesn't seem to be a `data/data/paper.md` after colrev init? -->

# 2. Search

```
colrev search
```

This operation adds a SearchSource to the project settings and record metadata are retrieved. SearchSources keep track of the associated queries, as well as the search results files. CoLRev includes serveral types of SearchSources such as, for example, traditional database searches, API-based searches, or backward and forward searches. For more information check the [documentation](https://colrev.readthedocs.io/en/latest/manual/metadata_retrieval/search.html).

**Steps:**

1. Add ACM Digital Library as our first search source:
```
colrev search --add colrev.acm_digital_library
```

2. ACM Digital Library can only be searched manually via a database search. Follow the instructions provided or go to the [search](https://dl.acm.org/action/doSearch?fillQuickSearch=false&target=advanced&expand=all&AllField=Title%3A%28microsourcing%29+OR+Abstract%3A%28microsourcing%29+OR+Keyword%3A%28microsourcing%29), select all records, click export, save the search query in `data/search/acm_digital_library_query.txt`, upload the export to `data/search/acm_digital_library.bib`, and press `Enter`.
3. Add AIS library as our first search source:

```
colrev search --add colrev.ais_library
```

4. Select SearchType API and paste the following as the search query to search for microsourcing in titles, abstracts, and keywords: `title:microsourcing OR abstract:microsourcing OR subject:microsourcing`

**Notes:**

- You can also use [litbaskets.io](https://litbaskets.io/) to search and use the Scopus export

```
colrev load
colrev prep
colrev dedupe
```

In the `colrev load` operation, search results are added to the main records. Records from the search result files are identified based on unique origin IDs and added to the main records file (`data/records.bib`). For more information check the [documentation](https://colrev.readthedocs.io/en/latest/manual/metadata_retrieval/load.html).

In the `colrev prep` operation, metadata quality of records is improved. Preparation procedures include general formatting rules, SearchSource-specific fixes, and cross-checks with metadata repositories and curated CoLRev repositories. For more information check the [documentation](https://colrev.readthedocs.io/en/latest/manual/metadata_retrieval/prep.html).

In the `colrev dedupe` operation, duplicate records are identified and merged. The predecessors of a merged record can be identified through the colrev_origin list field in `data/records.bib`, enabling ex-post validation and offering the possibility to undo merges. For more information check the [documentation](https://colrev.readthedocs.io/en/latest/manual/metadata_retrieval/dedupe.html).

**Steps:**

1. `colrev load`
2. `colrev prep`
3. `colrev dedupe`

**Notes:**

- At this point it may be a good idea to check the state of your CoLRev repository via `colrev status`

# Prescreen

```
colrev prescreen
```

# PDFs

```
colrev pdfs
```

- Check where the PDFs are stored

# Screen

```
colrev screen
```

**Notes:**

- You will be asked whether you would like to add screening criteria
- You can extract abstracts from the PDFs before the screen by running ``colrev screen --add_abstracts_from_tei``

# Data

```
colrev data
```

- Highlight the PRISMA chart, how to work with the synthesis list

<!-- 

# Optionals

pdf-backward search: copy from colrev search --help (options)
 -->
