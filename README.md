# videoTutorialSeriesUtilities
Collection of scripts that make creating RW.com video tutorial series ever so slightly easier


## createDirectoryStructure.sh

Creates the directory structure I use for RW video tutorial series. Takes two arguments:

- __videoList__ This is a file of the names of the different videos. In order.
- __outputDir__ The location of the output directory. This shouldn't exist - it'll be created for you.

The __videoList__ should look something like this:

    FirstVideoName
    SecondVideoName
    ThirdVideoName

This script will then create the following directory structure:

    <outputDir>
      |- 001_FirstVideoName
      |  |- 001_DemoStarter
      |  |  |- .gitkeep
      |  |- 001_DemoComplete
      |  |  |- .gitkeep
      |  |- 001_ChallengeStarter
      |  |  |- .gitkeep
      |  |- 001_ChallengeComplete
      |     |- .gitkeep
      |- 002_SecondVideoName
      |  |- 002_DemoStarter
      |  |  |- .gitkeep
      |  |- 002_DemoComplete
      |  |  |- .gitkeep
      |  |- 002_ChallengeStarter
      |  |  |- .gitkeep
      |  |- 002_ChallengeComplete
      |     |- .gitkeep
      |- 003_ThirdVideoName
         |- 003_DemoStarter
         |  |- .gitkeep
         |- 003_DemoComplete
         |  |- .gitkeep
         |- 003_ChallengeStarter
         |  |- .gitkeep
         |- 003_ChallengeComplete
            |- .gitkeep

## zipProjects.sh

This takes a directory structure like the one generated with `createDirectoryStructure.sh` and creates individual zips for each of the projects.

It takes two arguments - the location of the input directory and the output directory.
