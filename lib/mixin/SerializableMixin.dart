//import 'dart:mirrors';
//
// https://stackoverflow.com/questions/20024298/add-json-serializer-to-every-model-class#
//abstract class SerializableMixin {
//  Map toJson() {
//    Map map = new Map();
//    InstanceMirror im = reflect(this);
//    ClassMirror cm = im.type;
//    var decls = cm.declarations.values.where((dm) => dm is VariableMirror);
//    decls.forEach((dm) {
//      var key = MirrorSystem.getName(dm.simpleName);
//      var val = im.getField(dm.simpleName).reflectee;
//      map[key] = val;
//    });
//
//    return map;
//  }
//}