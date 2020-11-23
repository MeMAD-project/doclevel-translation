
# MeMAD Document-Level Machine Translation


This package provides document-level machine translation models trained within the [MeMAD project](https://memad.eu/). 

* trained using [Marian-NMT](https://marian-nmt.github.io/)
* transformer-base model (6 layers encoder/decoder)
* [sentence piece](https://github.com/google/sentencepiece) subword tokenisation
* extended content of max 100 tokens with sentence/paragraph boundaries
* trained on OPUS data (mix of domains)


## Quickstart

```
spm_encode --model models/fi-en/opus.src.spm32k-model < data/newstest2019-fien-src.fi.txt | scripts/split-text.pl -l 100 > data/data/newstest2019-fien-src.fi.doc100
marian-decoder -c models/fi-en/decoder.yml < data/newstest2019-fien-src.fi.doc100 > data/newstest2019-fien-sys.en.doc100
scripts/post-process.sh < data/newstest2019-fien-sys.en.doc100 > data/newstest2019-fien-sys.en.txt
```


## Models


* Finnish - Swedish (fi-sv)
* Swedish - Finnish (sv-fi)
* Finnish - English (fi-en)
* Finnish - French  (fi-fr)
* French  - Finnish (fr-fi)




## Data


Statistics of training data:

| language pair | segments pairs | sentences pairs|
|---------------|----------------|----------------|
| fi-sv         | 5,712,031      | 30,604,442     |
| fi-en         | 8,494,683      | 43,942,504     |
| fi-fr         | 6,087,869      | 30,138,134     |


Relevant links:

* [OPUS](http://opus.nlpl.eu/)
* [doclevel-MT-benchmark from DiscoMT2019](https://zenodo.org/record/3525366)
* [WMT2019 news test sets](http://data.statmt.org/wmt19/translation-task/test.tgz)



## Publications


* D4.2 Report on Discourse-Aware Machine Translation for Audiovisual Data, Maija Hirvonen; Maarit Koponen; Umut Sulubacak; Jörg Tiedemann, MemMAD deliverable, https://doi.org/10.5281/zenodo.3690764


* [Analysing concatenation approaches to document-level NMT in two different domains](https://www.aclweb.org/anthology/D19-6506), Yves Scherrer, Jörg Tiedemann, Sharid Loáiciga, DiscoMT 2019

```
@inproceedings{scherrer-etal-2019-analysing,
    title = "Analysing concatenation approaches to document-level {NMT} in two different domains",
    author = {Scherrer, Yves  and
      Tiedemann, J{\"o}rg  and
      Lo{\'a}iciga, Sharid},
    booktitle = "Proceedings of the Fourth Workshop on Discourse in Machine Translation (DiscoMT 2019)",
    month = nov,
    year = "2019",
    address = "Hong Kong, China",
    publisher = "Association for Computational Linguistics",
    url = "https://www.aclweb.org/anthology/D19-6506",
    doi = "10.18653/v1/D19-6506",
    pages = "51--61",
    abstract = "In this paper, we investigate how different aspects of discourse context affect the performance of recent neural MT systems. We describe two popular datasets covering news and movie subtitles and we provide a thorough analysis of the distribution of various document-level features in their domains. Furthermore, we train a set of context-aware MT models on both datasets and propose a comparative evaluation scheme that contrasts coherent context with artificially scrambled documents and absent context, arguing that the impact of discourse-aware MT models will become visible in this way. Our results show that the models are indeed affected by the manipulation of the test data, providing a different view on document-level translation quality than absolute sentence-level scores.",
}
```



* [The University of Helsinki Submissions to the WMT19 News Translation Task](https://www.aclweb.org/anthology/W19-5347), Aarne Talman, Umut Sulubacak, Raúl Vázquez, Yves Scherrer, Sami Virpioja, Alessandro Raganato, Arvi Hurskainen, Jörg Tiedemann, WMT 2019

```
@inproceedings{talman-etal-2019-university,
    title = "The {U}niversity of {H}elsinki Submissions to the {WMT}19 News Translation Task",
    author = {Talman, Aarne  and
      Sulubacak, Umut  and
      V{\'a}zquez, Ra{\'u}l  and
      Scherrer, Yves  and
      Virpioja, Sami  and
      Raganato, Alessandro  and
      Hurskainen, Arvi  and
      Tiedemann, J{\"o}rg},
    booktitle = "Proceedings of the Fourth Conference on Machine Translation (Volume 2: Shared Task Papers, Day 1)",
    month = aug,
    year = "2019",
    address = "Florence, Italy",
    publisher = "Association for Computational Linguistics",
    url = "https://www.aclweb.org/anthology/W19-5347",
    doi = "10.18653/v1/W19-5347",
    pages = "412--423",
    abstract = "In this paper we present the University of Helsinki submissions to the WMT 2019 shared news translation task in three language pairs: English-German, English-Finnish and Finnish-English. This year we focused first on cleaning and filtering the training data using multiple data-filtering approaches, resulting in much smaller and cleaner training sets. For English-German we trained both sentence-level transformer models as well as compared different document-level translation approaches. For Finnish-English and English-Finnish we focused on different segmentation approaches and we also included a rule-based system for English-Finnish.",
}
```


* [MT for subtitling: User evaluation of post-editing productivity](https://www.aclweb.org/anthology/2020.eamt-1.13), Maarit Koponen, Umut Sulubacak, Kaisa Vitikainen, Jörg Tiedemann, EAMT 2020

```
@inproceedings{koponen-etal-2020-mt,
    title = "{MT} for subtitling: User evaluation of post-editing productivity",
    author = {Koponen, Maarit  and
      Sulubacak, Umut  and
      Vitikainen, Kaisa  and
      Tiedemann, J{\"o}rg},
    booktitle = "Proceedings of the 22nd Annual Conference of the European Association for Machine Translation",
    month = nov,
    year = "2020",
    address = "Lisboa, Portugal",
    publisher = "European Association for Machine Translation",
    url = "https://www.aclweb.org/anthology/2020.eamt-1.13",
    pages = "115--124",
    abstract = "This paper presents a user evaluation of machine translation and post-editing for TV subtitles. Based on a process study where 12 professional subtitlers translated and post-edited subtitles, we compare effort in terms of task time and number of keystrokes. We also discuss examples of specific subtitling features like condensation, and how these features may have affected the post-editing results. In addition to overall MT quality, segmentation and timing of the subtitles are found to be important issues to be addressed in future work.",
}
```


* MT for Subtitling: Investigating professional translators' user experience and feedback, Koponen, Maarit and Sulubacak, Umut and Vitikainen, Kaisa and Tiedemann, Jörg, AMTA 2020

```
@inproceedings{koponen2020amta,
  title={MT for Subtitling: Investigating professional translators' user experience and feedback},
  author={Koponen, Maarit and Sulubacak, Umut and Vitikainen, Kaisa and Tiedemann, J\"{o}rg},
  booktitle={Proceedings of the 1st Workshop on Post-Editing in Modern-Day Translation (PEMDT) in the 14th Annual Conference of the Association for Machine Translation in the Americas (AMTA)},
  pages={79--92},
  year={2020}
}
```