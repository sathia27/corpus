# Sorkandu
  Corpus is a collection of words, tagged or annotated with their grammar components.

  We can use the text corpus to do the linguistic researches and projects.

  There are many projects run by government and many universities to create
  a text corpus for Tamil Language. Unfortunately, they are not open for public usage.

  We have to create a system to create a Corpus for Tamil, which is public.

  So that anyone can use the corpus data.

  Collecting words, assigning relevant tags, edit the tags are painful job to do manually and individually.

  This web application will enable the users to login, select a word, tag it properly, move to next word.

  The admin can load the words and do all the administrative tasks.

## System Dependencies
  * Linux / other unix / OSX 
  * Ruby 2.1
  * Rails 4
  * mysql 2

## Initiate app
```bash
  git clone git@github.com:sathia27/corpus.git
  cd corpus
  bundle install
  rake db:create
  rake db:migrate
  export CORPUS_DB=corpus_development
  export CORPUS_DB_USER=<YOUR MYSQL USERNAME>
  export CORPUS_DB_PASSWORD=<YOUR MYSQL PASSWORD>
```

## Demo
  http://corpus-sathia.rhcloud.com/

## Contributing

You can contribute to this project in different ways:

Report outstanding issues and bugs by creating an Issue
Suggest feature enhancements also via Issues
Fork the project, create a branch and file a pull request to improve the code itself
If you wish to participate contact the team on Mailing list https://lists.sourceforge.net/lists/listinfo/sorkandu-discussions/. So team will guide to move forward

## License
  This project is licensed under GPL V3

Please Contribute.
