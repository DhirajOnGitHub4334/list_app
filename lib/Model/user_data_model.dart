// To parse this JSON data, do
//
//     final UserVoterDataModel = UserVoterDataModelFromJson(jsonString);

import 'dart:convert';

UserVoterDataModel userVoterDataModelFromJson(String str) =>
    UserVoterDataModel.fromJson(json.decode(str));

String userVoterDataModelToJson(UserVoterDataModel data) =>
    json.encode(data.toJson());

class UserVoterDataModel {
  int id;
  String jsonrpc;
  List<Result> result;

  UserVoterDataModel({
    required this.id,
    required this.jsonrpc,
    required this.result,
  });

  factory UserVoterDataModel.fromJson(Map<String, dynamic> json) =>
      UserVoterDataModel(
        id: json["id"],
        jsonrpc: json["jsonrpc"] ?? "",
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jsonrpc": jsonrpc,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  List<ActiveVote> activeVotes;
  String author;
  String authorPayoutValue;
  double authorReputation;
  String? authorRole;
  String? authorTitle;
  List<Beneficiary> beneficiaries;
  List<dynamic> blacklists;
  String body;
  String category;
  int children;
  String? community;
  String? communityTitle;
  String created;
  String curatorPayoutValue;
  int depth;
  bool isPaidout;
  JsonMetadata jsonMetadata;
  String maxAcceptedPayout;
  int netRshares;
  double payout;
  String payoutAt;
  String pendingPayoutValue;
  int percentHbd;
  String permlink;
  int postId;
  String promoted;
  int reblogs;
  List<dynamic> replies;
  Stats stats;
  String title;
  String updated;
  String url;

  Result({
    required this.activeVotes,
    required this.author,
    required this.authorPayoutValue,
    required this.authorReputation,
    this.authorRole,
    this.authorTitle,
    required this.beneficiaries,
    required this.blacklists,
    required this.body,
    required this.category,
    required this.children,
    this.community,
    this.communityTitle,
    required this.created,
    required this.curatorPayoutValue,
    required this.depth,
    required this.isPaidout,
    required this.jsonMetadata,
    required this.maxAcceptedPayout,
    required this.netRshares,
    required this.payout,
    required this.payoutAt,
    required this.pendingPayoutValue,
    required this.percentHbd,
    required this.permlink,
    required this.postId,
    required this.promoted,
    required this.reblogs,
    required this.replies,
    required this.stats,
    required this.title,
    required this.updated,
    required this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        activeVotes:
            (json["active_votes"] == [] || json["active_votes"] == null)
                ? []
                : List<ActiveVote>.from(
                    json["active_votes"].map((x) => ActiveVote.fromJson(x))),
        author: json["author"] ?? "",
        authorPayoutValue: json["author_payout_value"] ?? "",
        authorReputation: json["author_reputation"]?.toDouble(),
        authorRole: json["author_role"] ?? "",
        authorTitle: json["author_title"] ?? "",
        beneficiaries:
            (json["beneficiaries"] == null || json["beneficiaries"] == [])
                ? []
                : List<Beneficiary>.from(
                    json["beneficiaries"].map((x) => Beneficiary.fromJson(x))),
        blacklists: (json["blacklists"] == null || json["blacklists"] == [])
            ? []
            : List<dynamic>.from(json["blacklists"].map((x) => x)),
        body: json["body"] ?? "",
        category: json["category"] ?? "",
        children: json["children"] ?? 0,
        community: json["community"] ?? "",
        communityTitle: json["community_title"] ?? "",
        created: json["created"] ?? "",
        curatorPayoutValue: json["curator_payout_value"] ?? "",
        depth: json["depth"] ?? 0,
        isPaidout: json["is_paidout"] ?? false,
        jsonMetadata: JsonMetadata.fromJson(json["json_metadata"]),
        maxAcceptedPayout: json["max_accepted_payout"] ?? "",
        netRshares: json["net_rshares"] ?? 0,
        payout: json["payout"]?.toDouble() ?? 0,
        payoutAt: json["payout_at"] ?? "",
        pendingPayoutValue: json["pending_payout_value"] ?? "",
        percentHbd: json["percent_hbd"] ?? 0,
        permlink: json["permlink"] ?? "",
        postId: json["post_id"] ?? 0,
        promoted: json["promoted"] ?? "",
        reblogs: json["reblogs"] ?? 0,
        replies: (json["replies"] == [] || json["replies"] == null)
            ? []
            : List<dynamic>.from(json["replies"].map((x) => x)),
        stats: Stats.fromJson(json["stats"]),
        title: json["title"] ?? "",
        updated: json["updated"] ?? "",
        url: json["url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "active_votes": List<dynamic>.from(activeVotes.map((x) => x.toJson())),
        "author": author,
        "author_payout_value": authorPayoutValue,
        "author_reputation": authorReputation,
        "author_role": authorRole,
        "author_title": authorTitle,
        "beneficiaries":
            List<dynamic>.from(beneficiaries.map((x) => x.toJson())),
        "blacklists": List<dynamic>.from(blacklists.map((x) => x)),
        "body": body,
        "category": category,
        "children": children,
        "community": community,
        "community_title": communityTitle,
        "created": created,
        "curator_payout_value": curatorPayoutValue,
        "depth": depth,
        "is_paidout": isPaidout,
        "json_metadata": jsonMetadata.toJson(),
        "max_accepted_payout": maxAcceptedPayout,
        "net_rshares": netRshares,
        "payout": payout,
        "payout_at": payoutAt,
        "pending_payout_value": pendingPayoutValue,
        "percent_hbd": percentHbd,
        "permlink": permlink,
        "post_id": postId,
        "promoted": promoted,
        "reblogs": reblogs,
        "replies": List<dynamic>.from(replies.map((x) => x)),
        "stats": stats.toJson(),
        "title": title,
        "updated": updated,
        "url": url,
      };
}

class ActiveVote {
  int rshares;
  String voter;

  ActiveVote({
    required this.rshares,
    required this.voter,
  });

  factory ActiveVote.fromJson(Map<String, dynamic> json) => ActiveVote(
        rshares: json["rshares"] ?? 0,
        voter: json["voter"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "rshares": rshares,
        "voter": voter,
      };
}

class Beneficiary {
  String account;
  int weight;

  Beneficiary({
    required this.account,
    required this.weight,
  });

  factory Beneficiary.fromJson(Map<String, dynamic> json) => Beneficiary(
        account: json["account"] ?? "",
        weight: json["weight"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "account": account,
        "weight": weight,
      };
}

class JsonMetadata {
  String app;
  String format;
  List<String>? image;
  List<String> tags;
  List<String>? users;
  String? description;
  List<String>? links;
  List<String>? imageRatios;
  List<String>? choices;
  String? contentType;
  int? endTime;
  Filters? filters;
  String? preferredInterpretation;
  String? question;
  bool? uiHideResUntilVoted;
  double? version;
  String? canonicalUrl;
  Dimensions? dimensions;
  List<dynamic>? images;
  bool? isPoll;
  String? type;
  Video? video;
  List<String>? thumbnails;
  String? community;
  Flow? flow;

  JsonMetadata({
    required this.app,
    required this.format,
    this.image,
    required this.tags,
    this.users,
    this.description,
    this.links,
    this.imageRatios,
    this.choices,
    this.contentType,
    this.endTime,
    this.filters,
    this.preferredInterpretation,
    this.question,
    this.uiHideResUntilVoted,
    this.version,
    this.canonicalUrl,
    this.dimensions,
    this.images,
    this.isPoll,
    this.type,
    this.video,
    this.thumbnails,
    this.community,
    this.flow,
  });

  factory JsonMetadata.fromJson(Map<String, dynamic> json) => JsonMetadata(
        app: json["app"] ?? "",
        format: json["format"] ?? "",
        image: (json["image"] == [] || json["image"] == null)
            ? []
            : List<String>.from(json["image"].map((x) => x)),
        tags: (json["tags"] == null || json["tags"] == [])
            ? []
            : List<String>.from(json["tags"].map((x) => x)),
        users: (json["users"] == [] || json["users"] == null)
            ? []
            : List<String>.from(json["users"].map((x) => x)),
        description: json["description"] ?? "",
        links: (json["links"] == [] || json["links"] == null)
            ? []
            : List<String>.from(json["links"].map((x) => x)),
        imageRatios:
            (json["image_ratios"] == null || json["image_ratios"] == [])
                ? []
                : List<String>.from(json["image_ratios"]!.map((x) => x)),
        choices: (json["choices"] == null || json["choices"] == [])
            ? []
            : List<String>.from(json["choices"]!.map((x) => x)),
        contentType: json["content_type"] ?? "",
        endTime: json["end_time"] ?? 0,
        filters:
            json["filters"] == null ? null : Filters.fromJson(json["filters"]),
        preferredInterpretation: json["preferred_interpretation"] ?? "",
        question: json["question"] ?? "",
        uiHideResUntilVoted: json["ui_hide_res_until_voted"] ?? false,
        version: json["version"]?.toDouble() ?? 0,
        canonicalUrl: json["canonical_url"] ?? "",
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromJson(json["dimensions"]),
        images: (json["images"] == null || json["images"] == [])
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        isPoll: json["isPoll"] ?? false,
        type: json["type"] ?? "",
        video: json["video"] == null ? null : Video.fromJson(json["video"]),
        thumbnails: (json["thumbnails"] == null || json["thumbnails"] == [])
            ? []
            : List<String>.from(json["thumbnails"]!.map((x) => x)),
        community: json["community"] ?? "",
        flow: json["flow"] == null ? null : Flow.fromJson(json["flow"]),
      );

  Map<String, dynamic> toJson() => {
        "app": app,
        "format": format,
        "image": image,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "users": users,
        "description": description,
        "links": links,
        "image_ratios": imageRatios == null
            ? []
            : List<dynamic>.from(imageRatios!.map((x) => x)),
        "choices":
            choices == null ? [] : List<dynamic>.from(choices!.map((x) => x)),
        "content_type": contentType,
        "end_time": endTime,
        "filters": filters?.toJson(),
        "preferred_interpretation": preferredInterpretation,
        "question": question,
        "ui_hide_res_until_voted": uiHideResUntilVoted,
        "version": version,
        "canonical_url": canonicalUrl,
        "dimensions": dimensions?.toJson(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "isPoll": isPoll,
        "type": type,
        "video": video?.toJson(),
        "thumbnails": thumbnails == null
            ? []
            : List<dynamic>.from(thumbnails!.map((x) => x)),
        "community": community,
        "flow": flow?.toJson(),
      };
}

class Dimensions {
  Dimensions();

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions();

  Map<String, dynamic> toJson() => {};
}

class Filters {
  int accountAge;

  Filters({
    required this.accountAge,
  });

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        accountAge: json["account_age"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "account_age": accountAge,
      };
}

class Flow {
  List<Picture> pictures;
  List<String> tags;

  Flow({
    required this.pictures,
    required this.tags,
  });

  factory Flow.fromJson(Map<String, dynamic> json) => Flow(
        pictures: (json["pictures"] == null || json["pictures"] == [])
            ? []
            : List<Picture>.from(
                json["pictures"].map((x) => Picture.fromJson(x))),
        tags: (json["tags"] == null || json["tags"] == [])
            ? []
            : List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "pictures": List<dynamic>.from(pictures.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x)),
      };
}

class Picture {
  String caption;
  int id;
  String mime;
  String name;
  List<dynamic> tags;
  String url;

  Picture({
    required this.caption,
    required this.id,
    required this.mime,
    required this.name,
    required this.tags,
    required this.url,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        caption: json["caption"] ?? "",
        id: json["id"] ?? 0,
        mime: json["mime"] ?? "",
        name: json["name"],
        tags: (json["tags"] == [] || json["tags"] == null)
            ? []
            : List<dynamic>.from(json["tags"].map((x) => x)),
        url: json["url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "caption": caption,
        "id": id,
        "mime": mime,
        "name": name,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "url": url,
      };
}

class Video {
  Content content;
  Info info;

  Video({
    required this.content,
    required this.info,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        content: Content.fromJson(json["content"]),
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content.toJson(),
        "info": info.toJson(),
      };
}

class Content {
  String description;
  List<String> tags;

  Content({
    required this.description,
    required this.tags,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        description: json["description"] ?? "",
        tags: (json["tags"] == null || json["tags"] == [])
            ? []
            : List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "tags": List<dynamic>.from(tags.map((x) => x)),
      };
}

class Info {
  String author;
  double duration;
  String file;
  int filesize;
  bool firstUpload;
  dynamic ipfs;
  dynamic ipfsThumbnail;
  String lang;
  String permlink;
  String platform;
  List<SourceMap> sourceMap;
  String title;
  String videoV2;

  Info({
    required this.author,
    required this.duration,
    required this.file,
    required this.filesize,
    required this.firstUpload,
    required this.ipfs,
    required this.ipfsThumbnail,
    required this.lang,
    required this.permlink,
    required this.platform,
    required this.sourceMap,
    required this.title,
    required this.videoV2,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        author: json["author"] ?? "",
        duration: json["duration"]?.toDouble() ?? 0,
        file: json["file"] ?? "",
        filesize: json["filesize"] ?? 0,
        firstUpload: json["firstUpload"] ?? false,
        ipfs: json["ipfs"] ?? "",
        ipfsThumbnail: json["ipfsThumbnail"] ?? "",
        lang: json["lang"] ?? "",
        permlink: json["permlink"] ?? "",
        platform: json["platform"] ?? "",
        sourceMap: (json["sourceMap"] == null || json["sourceMap"] == [])
            ? []
            : List<SourceMap>.from(
                json["sourceMap"].map((x) => SourceMap.fromJson(x))),
        title: json["title"] ?? "",
        videoV2: json["video_v2"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "duration": duration,
        "file": file,
        "filesize": filesize,
        "firstUpload": firstUpload,
        "ipfs": ipfs,
        "ipfsThumbnail": ipfsThumbnail,
        "lang": lang,
        "permlink": permlink,
        "platform": platform,
        "sourceMap": List<dynamic>.from(sourceMap.map((x) => x.toJson())),
        "title": title,
        "video_v2": videoV2,
      };
}

class SourceMap {
  String? format;
  String type;
  String url;

  SourceMap({
    this.format,
    required this.type,
    required this.url,
  });

  factory SourceMap.fromJson(Map<String, dynamic> json) => SourceMap(
        format: json["format"] ?? "",
        type: json["type"] ?? "",
        url: json["url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "format": format,
        "type": type,
        "url": url,
      };
}

class Stats {
  double flagWeight;
  bool gray;
  bool hide;
  int totalVotes;
  bool? isPinned;

  Stats({
    required this.flagWeight,
    required this.gray,
    required this.hide,
    required this.totalVotes,
    this.isPinned,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        flagWeight: json["flag_weight"] ?? 0,
        gray: json["gray"] ?? false,
        hide: json["hide"] ?? false,
        totalVotes: json["total_votes"] ?? 0,
        isPinned: json["is_pinned"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "flag_weight": flagWeight,
        "gray": gray,
        "hide": hide,
        "total_votes": totalVotes,
        "is_pinned": isPinned,
      };
}
