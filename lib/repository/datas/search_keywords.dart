/// curPage : 1
/// datas : [{"adminAdd":false,"apkLink":"","audit":1,"author":"wo5813288","canEdit":false,"chapterId":294,"chapterName":"完整项目","collect":false,"courseId":13,"desc":"更新学习flutter，所以系统的做一款应用来实践一下。这款应用也开发了很多内容了，后续还要继续更新功能。开发这个项目主要也是熟悉flutter的树形结构的写法和UI组件，项目中也用到了flutter比较流行的第三方框架。","descMd":"","envelopePic":"https://www.wanandroid.com/blogimgs/e092cd25-3e43-42c4-a7eb-b1ebc60ce02a.png","fresh":false,"host":"","id":18624,"isAdminAdd":false,"link":"https://www.wanandroid.com/blog/show/3020","niceDate":"2021-06-15 22:51","niceShareDate":"2021-06-15 22:51","origin":"","prefix":"","projectLink":"https://github.com/wo5813288/wan_giao","publishTime":1623768707000,"realSuperChapterId":293,"selfVisible":0,"shareDate":1623768707000,"shareUser":"","superChapterId":294,"superChapterName":"开源项目主Tab","tags":[{"name":"项目","url":"/project/list/1?cid=294"}],"title":"Flutter开发的WanAndroid","type":0,"userId":-1,"visible":1,"zan":0},{"adminAdd":false,"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":494,"chapterName":"广场","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":12469,"isAdminAdd":false,"link":"https://www.jianshu.com/p/146312dc748c","niceDate":"2020-03-18 15:13","niceShareDate":"2020-03-18 15:13","origin":"","prefix":"","projectLink":"","publishTime":1584515603000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1584515603000,"shareUser":"13283949001","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"多线程基础之线程间通信-Java版","type":0,"userId":53432,"visible":0,"zan":0},{"adminAdd":false,"apkLink":"","audit":1,"author":"u013132758","canEdit":false,"chapterId":60,"chapterName":"Android Studio相关","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":982,"isAdminAdd":false,"link":"http://blog.csdn.net/u013132758/article/details/52355915","niceDate":"2016-09-03 18:33","niceShareDate":"未知时间","origin":"CSDN","prefix":"","projectLink":"","publishTime":1472898835000,"realSuperChapterId":150,"selfVisible":0,"shareDate":null,"shareUser":"","superChapterId":60,"superChapterName":"开发环境","tags":[],"title":"gradle 详解——你真的了解Gradle吗？","type":0,"userId":-1,"visible":1,"zan":0}]
/// offset : 0
/// over : true
/// pageCount : 0
/// size : 20
/// total : 0

class SearchKeywords {
  SearchKeywords({
    num? curPage,
    List<SearchRespItem>? datas,
    num? offset,
    bool? over,
    num? pageCount,
    num? size,
    num? total,
  }) {
    _curPage = curPage;
    _datas = datas;
    _offset = offset;
    _over = over;
    _pageCount = pageCount;
    _size = size;
    _total = total;
  }

  SearchKeywords.fromJson(dynamic json) {
    _curPage = json['curPage'];
    if (json['datas'] != null) {
      _datas = [];
      json['datas'].forEach((v) {
        _datas?.add(SearchRespItem.fromJson(v));
      });
    }
    _offset = json['offset'];
    _over = json['over'];
    _pageCount = json['pageCount'];
    _size = json['size'];
    _total = json['total'];
  }

  num? _curPage;
  List<SearchRespItem>? _datas;
  num? _offset;
  bool? _over;
  num? _pageCount;
  num? _size;
  num? _total;

  SearchKeywords copyWith({
    num? curPage,
    List<SearchRespItem>? datas,
    num? offset,
    bool? over,
    num? pageCount,
    num? size,
    num? total,
  }) =>
      SearchKeywords(
        curPage: curPage ?? _curPage,
        datas: datas ?? _datas,
        offset: offset ?? _offset,
        over: over ?? _over,
        pageCount: pageCount ?? _pageCount,
        size: size ?? _size,
        total: total ?? _total,
      );

  num? get curPage => _curPage;

  List<SearchRespItem>? get datas => _datas;

  num? get offset => _offset;

  bool? get over => _over;

  num? get pageCount => _pageCount;

  num? get size => _size;

  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['curPage'] = _curPage;
    if (_datas != null) {
      map['datas'] = _datas?.map((v) => v.toJson()).toList();
    }
    map['offset'] = _offset;
    map['over'] = _over;
    map['pageCount'] = _pageCount;
    map['size'] = _size;
    map['total'] = _total;
    return map;
  }
}

/// adminAdd : false
/// apkLink : ""
/// audit : 1
/// author : "wo5813288"
/// canEdit : false
/// chapterId : 294
/// chapterName : "完整项目"
/// collect : false
/// courseId : 13
/// desc : "更新学习flutter，所以系统的做一款应用来实践一下。这款应用也开发了很多内容了，后续还要继续更新功能。开发这个项目主要也是熟悉flutter的树形结构的写法和UI组件，项目中也用到了flutter比较流行的第三方框架。"
/// descMd : ""
/// envelopePic : "https://www.wanandroid.com/blogimgs/e092cd25-3e43-42c4-a7eb-b1ebc60ce02a.png"
/// fresh : false
/// host : ""
/// id : 18624
/// isAdminAdd : false
/// link : "https://www.wanandroid.com/blog/show/3020"
/// niceDate : "2021-06-15 22:51"
/// niceShareDate : "2021-06-15 22:51"
/// origin : ""
/// prefix : ""
/// projectLink : "https://github.com/wo5813288/wan_giao"
/// publishTime : 1623768707000
/// realSuperChapterId : 293
/// selfVisible : 0
/// shareDate : 1623768707000
/// shareUser : ""
/// superChapterId : 294
/// superChapterName : "开源项目主Tab"
/// tags : [{"name":"项目","url":"/project/list/1?cid=294"}]
/// title : "Flutter开发的WanAndroid"
/// type : 0
/// userId : -1
/// visible : 1
/// zan : 0

class SearchRespItem {
  SearchRespItem({
    bool? adminAdd,
    String? apkLink,
    num? audit,
    String? author,
    bool? canEdit,
    num? chapterId,
    String? chapterName,
    bool? collect,
    num? courseId,
    String? desc,
    String? descMd,
    String? envelopePic,
    bool? fresh,
    String? host,
    num? id,
    bool? isAdminAdd,
    String? link,
    String? niceDate,
    String? niceShareDate,
    String? origin,
    String? prefix,
    String? projectLink,
    num? publishTime,
    num? realSuperChapterId,
    num? selfVisible,
    num? shareDate,
    String? shareUser,
    num? superChapterId,
    String? superChapterName,
    List<Tags>? tags,
    String? title,
    num? type,
    num? userId,
    num? visible,
    num? zan,
  }) {
    _adminAdd = adminAdd;
    _apkLink = apkLink;
    _audit = audit;
    _author = author;
    _canEdit = canEdit;
    _chapterId = chapterId;
    _chapterName = chapterName;
    _collect = collect;
    _courseId = courseId;
    _desc = desc;
    _descMd = descMd;
    _envelopePic = envelopePic;
    _fresh = fresh;
    _host = host;
    _id = id;
    _isAdminAdd = isAdminAdd;
    _link = link;
    _niceDate = niceDate;
    _niceShareDate = niceShareDate;
    _origin = origin;
    _prefix = prefix;
    _projectLink = projectLink;
    _publishTime = publishTime;
    _realSuperChapterId = realSuperChapterId;
    _selfVisible = selfVisible;
    _shareDate = shareDate;
    _shareUser = shareUser;
    _superChapterId = superChapterId;
    _superChapterName = superChapterName;
    _tags = tags;
    _title = title;
    _type = type;
    _userId = userId;
    _visible = visible;
    _zan = zan;
  }

  SearchRespItem.fromJson(dynamic json) {
    _adminAdd = json['adminAdd'];
    _apkLink = json['apkLink'];
    _audit = json['audit'];
    _author = json['author'];
    _canEdit = json['canEdit'];
    _chapterId = json['chapterId'];
    _chapterName = json['chapterName'];
    _collect = json['collect'];
    _courseId = json['courseId'];
    _desc = json['desc'];
    _descMd = json['descMd'];
    _envelopePic = json['envelopePic'];
    _fresh = json['fresh'];
    _host = json['host'];
    _id = json['id'];
    _isAdminAdd = json['isAdminAdd'];
    _link = json['link'];
    _niceDate = json['niceDate'];
    _niceShareDate = json['niceShareDate'];
    _origin = json['origin'];
    _prefix = json['prefix'];
    _projectLink = json['projectLink'];
    _publishTime = json['publishTime'];
    _realSuperChapterId = json['realSuperChapterId'];
    _selfVisible = json['selfVisible'];
    _shareDate = json['shareDate'];
    _shareUser = json['shareUser'];
    _superChapterId = json['superChapterId'];
    _superChapterName = json['superChapterName'];
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(Tags.fromJson(v));
      });
    }
    _title = json['title'];
    _type = json['type'];
    _userId = json['userId'];
    _visible = json['visible'];
    _zan = json['zan'];
  }

  bool? _adminAdd;
  String? _apkLink;
  num? _audit;
  String? _author;
  bool? _canEdit;
  num? _chapterId;
  String? _chapterName;
  bool? _collect;
  num? _courseId;
  String? _desc;
  String? _descMd;
  String? _envelopePic;
  bool? _fresh;
  String? _host;
  num? _id;
  bool? _isAdminAdd;
  String? _link;
  String? _niceDate;
  String? _niceShareDate;
  String? _origin;
  String? _prefix;
  String? _projectLink;
  num? _publishTime;
  num? _realSuperChapterId;
  num? _selfVisible;
  num? _shareDate;
  String? _shareUser;
  num? _superChapterId;
  String? _superChapterName;
  List<Tags>? _tags;
  String? _title;
  num? _type;
  num? _userId;
  num? _visible;
  num? _zan;

  SearchRespItem copyWith({
    bool? adminAdd,
    String? apkLink,
    num? audit,
    String? author,
    bool? canEdit,
    num? chapterId,
    String? chapterName,
    bool? collect,
    num? courseId,
    String? desc,
    String? descMd,
    String? envelopePic,
    bool? fresh,
    String? host,
    num? id,
    bool? isAdminAdd,
    String? link,
    String? niceDate,
    String? niceShareDate,
    String? origin,
    String? prefix,
    String? projectLink,
    num? publishTime,
    num? realSuperChapterId,
    num? selfVisible,
    num? shareDate,
    String? shareUser,
    num? superChapterId,
    String? superChapterName,
    List<Tags>? tags,
    String? title,
    num? type,
    num? userId,
    num? visible,
    num? zan,
  }) =>
      SearchRespItem(
        adminAdd: adminAdd ?? _adminAdd,
        apkLink: apkLink ?? _apkLink,
        audit: audit ?? _audit,
        author: author ?? _author,
        canEdit: canEdit ?? _canEdit,
        chapterId: chapterId ?? _chapterId,
        chapterName: chapterName ?? _chapterName,
        collect: collect ?? _collect,
        courseId: courseId ?? _courseId,
        desc: desc ?? _desc,
        descMd: descMd ?? _descMd,
        envelopePic: envelopePic ?? _envelopePic,
        fresh: fresh ?? _fresh,
        host: host ?? _host,
        id: id ?? _id,
        isAdminAdd: isAdminAdd ?? _isAdminAdd,
        link: link ?? _link,
        niceDate: niceDate ?? _niceDate,
        niceShareDate: niceShareDate ?? _niceShareDate,
        origin: origin ?? _origin,
        prefix: prefix ?? _prefix,
        projectLink: projectLink ?? _projectLink,
        publishTime: publishTime ?? _publishTime,
        realSuperChapterId: realSuperChapterId ?? _realSuperChapterId,
        selfVisible: selfVisible ?? _selfVisible,
        shareDate: shareDate ?? _shareDate,
        shareUser: shareUser ?? _shareUser,
        superChapterId: superChapterId ?? _superChapterId,
        superChapterName: superChapterName ?? _superChapterName,
        tags: tags ?? _tags,
        title: title ?? _title,
        type: type ?? _type,
        userId: userId ?? _userId,
        visible: visible ?? _visible,
        zan: zan ?? _zan,
      );

  bool? get adminAdd => _adminAdd;

  String? get apkLink => _apkLink;

  num? get audit => _audit;

  String? get author => _author;

  bool? get canEdit => _canEdit;

  num? get chapterId => _chapterId;

  String? get chapterName => _chapterName;

  bool? get collect => _collect;

  num? get courseId => _courseId;

  String? get desc => _desc;

  String? get descMd => _descMd;

  String? get envelopePic => _envelopePic;

  bool? get fresh => _fresh;

  String? get host => _host;

  num? get id => _id;

  bool? get isAdminAdd => _isAdminAdd;

  String? get link => _link;

  String? get niceDate => _niceDate;

  String? get niceShareDate => _niceShareDate;

  String? get origin => _origin;

  String? get prefix => _prefix;

  String? get projectLink => _projectLink;

  num? get publishTime => _publishTime;

  num? get realSuperChapterId => _realSuperChapterId;

  num? get selfVisible => _selfVisible;

  num? get shareDate => _shareDate;

  String? get shareUser => _shareUser;

  num? get superChapterId => _superChapterId;

  String? get superChapterName => _superChapterName;

  List<Tags>? get tags => _tags;

  String? get title => _title;

  num? get type => _type;

  num? get userId => _userId;

  num? get visible => _visible;

  num? get zan => _zan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adminAdd'] = _adminAdd;
    map['apkLink'] = _apkLink;
    map['audit'] = _audit;
    map['author'] = _author;
    map['canEdit'] = _canEdit;
    map['chapterId'] = _chapterId;
    map['chapterName'] = _chapterName;
    map['collect'] = _collect;
    map['courseId'] = _courseId;
    map['desc'] = _desc;
    map['descMd'] = _descMd;
    map['envelopePic'] = _envelopePic;
    map['fresh'] = _fresh;
    map['host'] = _host;
    map['id'] = _id;
    map['isAdminAdd'] = _isAdminAdd;
    map['link'] = _link;
    map['niceDate'] = _niceDate;
    map['niceShareDate'] = _niceShareDate;
    map['origin'] = _origin;
    map['prefix'] = _prefix;
    map['projectLink'] = _projectLink;
    map['publishTime'] = _publishTime;
    map['realSuperChapterId'] = _realSuperChapterId;
    map['selfVisible'] = _selfVisible;
    map['shareDate'] = _shareDate;
    map['shareUser'] = _shareUser;
    map['superChapterId'] = _superChapterId;
    map['superChapterName'] = _superChapterName;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    map['title'] = _title;
    map['type'] = _type;
    map['userId'] = _userId;
    map['visible'] = _visible;
    map['zan'] = _zan;
    return map;
  }
}

/// name : "项目"
/// url : "/project/list/1?cid=294"

class Tags {
  Tags({
    String? name,
    String? url,
  }) {
    _name = name;
    _url = url;
  }

  Tags.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }

  String? _name;
  String? _url;

  Tags copyWith({
    String? name,
    String? url,
  }) =>
      Tags(
        name: name ?? _name,
        url: url ?? _url,
      );

  String? get name => _name;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }
}
