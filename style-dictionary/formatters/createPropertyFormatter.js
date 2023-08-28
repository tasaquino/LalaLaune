const defaultFormatting = {
  prefix: '',
  indentation: '',
  separator: ' = ',
  suffix: ';'
}
  
function createPropertyFormatter() {
  let {prefix, indentation, separator, suffix} = defaultFormatting;

  return function(prop) {
    return `static const ${indentation}${prefix}${prop.name}${separator}${prop.value}${suffix}`;
  }
}
  
module.exports = createPropertyFormatter;