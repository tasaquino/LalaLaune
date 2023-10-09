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

![design_system](https://github.com/tasaquino/LalaLauneFlutter/assets/10437479/1087569e-371c-46d2-bf12-beeb464a3a13)



## Prototype:

![prototypes_lalalaune](https://github.com/tasaquino/LalaLauneFlutter/assets/10437479/55bc3117-3fb3-4c6c-bae7-7af05b4c89a1)

## Localisation
To generate the localisation files run:
    flutter gen-l10n
