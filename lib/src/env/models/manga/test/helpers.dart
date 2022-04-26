class Helpers {
  static findById(list, key) {
    var findById = (obj) => obj.key == key;
    var result = list.where(findById);
    return result.length > 0 ? result.first : null;
  }
}
