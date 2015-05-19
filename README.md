# PS Script to generate custom bitmap fonts for [Space Engineers](https://github.com/KeenSoftwareHouse/SpaceEngineers)

## Usage
```
.\generate PATH_TO_SPAGE_ENGINEERS FONT_FACE OUTPUT_NAME
```

## Example
```
.\generate "C:\Steam\steamapps\common\SpaceEngineers" Consolas monospace
```

This will generate a new font based on `Consolas` font and copy it into `monospace` subfolder in `C:\Steam\steamapps\common\SpaceEngineers\Content\Font`.

## Known issues

* Generated font includes extra characters and may consume too much memory.
