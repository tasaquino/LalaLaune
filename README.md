![Build Status](https://github.com/tasaquino/LalaLaune/actions/workflows/main.yml/badge.svg?branch=main)
[![codecov](https://codecov.io/gh/tasaquino/LalaLaune/graph/badge.svg?token=0RIRM8T98A)](https://codecov.io/gh/tasaquino/LalaLaune)

# LalaLaune
LalaLaune is a journaling app that makes possible for user to log daily notes with images/video/voice and has integration with Spotify to bring songs to journaling experience.

# Design System
As part of my studies, I've included a Design System to be used in the app and build the theme/styling on top of it.
There is an integration between Figma and GitHub that when I change any color, for example, on Figma project and publish it to gitHub the updated tokens should be available in the project after pulling the changes from the repository.
The plugin in use is https://tokens.studio/
To generate the dart files from the tokens I am using style-dictionary https://amzn.github.io/style-dictionary with some modifications with custom Formatter and custom Transforms to better translate the Typography into Flutter TextStyles.
The configuration for style-dictionary can be found here: https://github.com/tasaquino/LalaLaune/tree/main/style-dictionary

To generate the style file in dart, with the customised formatters that were created run custom build script from style-dictionary directory:
    node build.js

![design_system](https://github.com/tasaquino/LalaLaune/assets/10437479/02e36715-6f18-42b9-8bca-ed68136dbb7f)

## Prototype:
![Screenshot 2023-08-23 at 11 24 07 pm](https://github.com/tasaquino/LalaLaune/assets/10437479/43d64ac5-300a-4457-a55b-fbc6e73ff2b1)

## Localisation
To generate the localisation files run:
    flutter gen-l10n