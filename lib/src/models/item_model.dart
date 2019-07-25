// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
    ShortcodeMedia shortcodeMedia;

    Item({
        this.shortcodeMedia,
    });

    factory Item.fromJson(Map<String, dynamic> json) => new Item(
        shortcodeMedia: ShortcodeMedia.fromJson(json["shortcode_media"]),
    );

    Map<String, dynamic> toJson() => {
        "shortcode_media": shortcodeMedia.toJson(),
    };
}

class ShortcodeMedia {
    String typename;
    String id;
    String shortcode;
    String displayUrl;
    bool isVideo;
    String videoUrl;
    EdgeSidecarToChildren edgeSidecarToChildren;

    ShortcodeMedia({
        this.typename,
        this.id,
        this.shortcode,
        this.displayUrl,
        this.isVideo,
        this.videoUrl,
        this.edgeSidecarToChildren,
    });

    factory ShortcodeMedia.fromJson(Map<String, dynamic> json) => new ShortcodeMedia(
        typename: json["__typename"],
        id: json["id"],
        shortcode: json["shortcode"],
        displayUrl: json["display_url"],
        isVideo: json["is_video"],
        videoUrl: json["video_url"],
        edgeSidecarToChildren: EdgeSidecarToChildren.fromJson(json["edge_sidecar_to_children"]),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "id": id,
        "shortcode": shortcode,
        "display_url": displayUrl,
        "is_video": isVideo,
        "video_url": videoUrl,
        "edge_sidecar_to_children": edgeSidecarToChildren.toJson(),
    };
}

class EdgeSidecarToChildren {
    List<Edge> edges;

    EdgeSidecarToChildren({
        this.edges,
    });

    factory EdgeSidecarToChildren.fromJson(Map<String, dynamic> json) => new EdgeSidecarToChildren(
        edges: new List<Edge>.from(json["edges"].map((x) => Edge.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "edges": new List<dynamic>.from(edges.map((x) => x.toJson())),
    };
}

class Edge {
    Edge();

    factory Edge.fromJson(Map<String, dynamic> json) => new Edge(
    );

    Map<String, dynamic> toJson() => {
    };
}
