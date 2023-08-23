const StyleDictionary = require('style-dictionary');
const _template = require('lodash/template');
const fs = require('fs');
const Color = require('tinycolor2');
const {
  fileHeader,
  sortByReference,
  createPropertyFormatter,
  sortByName,
} = require('./formatters');
console.log('Building your style dictionary ☕️ ...');

StyleDictionary.registerFormat({
  name: 'customFormat',
  formatter: function({dictionary, platform, options, file}) {
    const template = _template(
      fs.readFileSync(__dirname + '/templates/class.dart.template')
    );
    let allTokens;
    
    const { outputReferences } = options;
    const formatProperty = createPropertyFormatter({
      outputReferences,
      dictionary
    });

    if (outputReferences) {
      allTokens = [...dictionary.allTokens].sort(sortByReference(dictionary));
    } else {
      allTokens = [...dictionary.allTokens].sort(sortByName)
    }
    return template({allTokens, file, options, formatProperty, fileHeader});
  }
})

function generateColor(value) {
  var str = Color(value).toHex8().toUpperCase();
  return `const Color(0x${str.slice(6)}${str.slice(0, 6)})`;
}

StyleDictionary.registerTransform({
  name: 'fontFamilies',
  type: 'value',
  transitive: true,
  matcher: ({ type }) => {
    return type === 'fontFamilies' || type === 'fontWeights';
},
transformer: function ({ name, type, value }) {
  if (type === 'fontWeights') {
    if (value.toUpperCase() === 'BOLD') {
      return 'FontWeight.bold';
    } else if (value.toUpperCase() === 'NORMAL') {
      return 'FontWeight.normal';
    } else if (value.toUpperCase() === 'SEMIBOLD') {
      return 'FontWeight.w600';
    } else if(!isNaN(value)) {
      return `FontWeight.w${value}`;
    }
  } else if (type === 'fontFamilies') {
    return `'${value}'`
  }
  return value;
}
});

StyleDictionary.registerTransform({
  name: 'color',
  type: 'value',
  transitive: true,
  matcher: ({ type }) => {
    return type === 'color';
},
transformer: function ({ name, type, value }) {
  return generateColor(value);
}
});

StyleDictionary.registerTransform({
  name: 'typography',
  type: 'value',
  transitive: true,
  matcher: ({ type }) => {
    return type === 'typography';
},
transformer: function ({ name, type, value: { fontFamily, fontStyle, fontWeight, fontSize, lineHeight, textDecoration, letterSpacing, lineHeights} }) {

  if (type !== 'typography') return '';
  var result = 'TextStyle(';
  if (fontFamily) result += `fontFamily: ${fontFamily},`;
  if (fontSize) result += 'fontSize: ' + fontSize + ',';
  if (fontWeight && !isNaN(fontWeight)) result += `fontWeight: FontWeight.w${fontWeight},`;
  if (fontWeight && fontWeight === 'regular') result += 'fontWeight: FontWeight.normal,';
  if (letterSpacing) result += 'letterSpacing: ' + letterSpacing.replace('%', '') + ',';
  if (lineHeight) result += 'height: ' + lineHeight / fontSize + ',';
  if (textDecoration) {
      result += 'decoration: TextDecoration.';
      switch (textDecoration) {
          case 'line-through':
              result += 'lineThrough'
              break;
          case 'underline':
              result += 'underline'
              break;
          default:
              result += 'none'
              break;
      }
      result += ',';
  }
  result += ')';
  return result;
}
});

StyleDictionary.registerTransformGroup({
    name: 'custom/flutter',
    transforms: ['color', 'fontFamilies', 'typography']
  });

const StyleDictionaryExtended = StyleDictionary.extend(__dirname + '/config.json');

StyleDictionaryExtended.buildAllPlatforms();

console.log('\nStyle dictionary built!😎');