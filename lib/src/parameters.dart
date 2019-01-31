library igdb_wrapper.parameters;

import 'enums.dart';

class Parameters {
  final List<String> _filters = [];
  var _offset = "";
  var _ids = "";
  var _fields = "";
  var _expand = "";
  var _limit = "";
  var _order = "";
  var _search = "";
  var _scroll = "";
  var _query = "";

  Parameters addFilter(String filter) {
    _filters.add(("&filter" + filter).replaceAll(RegExp(" "), ""));
    return this;
  }

  Parameters addIds(String ids) {
    _ids = ids.replaceAll(RegExp(" "), "");
    return this;
  }

  Parameters addOffset(String offset) {
    _offset = "&offset=" + offset.replaceAll(RegExp(" "), "");
    return this;
  }

  Parameters addFields(String fields) {
    _fields = fields.replaceAll(RegExp(" "), "");
    return this;
  }

  Parameters addExpand(String expand) {
    _expand = "&expand=" + expand.replaceAll(RegExp(" "), "");
    return this;
  }

  Parameters addLimit(String limit) {
    _limit = "&limit=" + limit.replaceAll(RegExp(" "), "");
    return this;
  }

  Parameters addOrder(String order) {
    _order = "&order=" + order.replaceAll(RegExp(" "), "");
    return this;
  }

  Parameters addSearch(String search) {
    _search = "?search=" + search.replaceAll(RegExp(" "), "%20");
    return this;
  }

  Parameters addScroll(String scroll) {
    _scroll = "&scroll=" + scroll.replaceAll(RegExp(" "), "");
    return this;
  }

  String buildQuery(Endpoint endpoint) {
    var filter = "";
    for (String s in _filters) {
      filter += s;
    }

    _query = endpoint.toString().toLowerCase().substring(9);
    _query += "/" + _ids + _search;

    if (_fields != "" && _search != "") {
      _query += "&fields=" + _fields;
    } else if (_fields.isNotEmpty) {
      _query += "?fields=" + _fields;
    } else {
      _query += "?fields=*";
    }

    _query += filter + _expand + _order + _limit + _offset + _scroll;
    return _query;
  }
}
