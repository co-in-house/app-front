import 'package:Inhouse/component/community/communityInfoListDelegate.dart';
import 'package:Inhouse/component/text/tag.dart';
import 'package:Inhouse/util/format.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CommunityBasicInfoContainer extends CommunityBaseContainer {
  CommunityBasicInfoContainer({this.location, this.subscriber, this.labelList});
  final List<String> labelList;
  final String location;
  final int subscriber;
  final double _rowMarginVertical = 2;

  @override
  Widget buildChild(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _tagRow(),
        _subscriberRow(),
        _locationRow(),
        _activityRow(),
        _requirementRow(),
        _remarksRow(),
      ],
    );
  }

  Widget _tagRow() {
    List<Widget> tagList = List<Widget>.generate(this.labelList.length,
        (int index) => TagWidget(label: this.labelList[index]));
    tagList.add(TagWidget(label: "aaaa"));
    tagList.add(TagWidget(label: "aaaa"));
    tagList.add(TagWidget(label: "aaaa"));
    tagList.add(TagWidget(label: "aaaa"));
    return _baseRow(
      Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Icon(Icons.label),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              child: Wrap(
                children: tagList,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _locationRow() {
    return _baseRow(
      Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Icon(Icons.location_on),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Text("Location:", style: TextStyle(color: Colors.grey)),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Text(this.location, style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  Widget _subscriberRow() {
    return _baseRow(
      Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Icon(Icons.people),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Text("Subscriber:", style: TextStyle(color: Colors.grey)),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Text(NumberUtil.formattedInteger(this.subscriber),
                style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  Widget _activityRow() {
    return _baseRow(
      Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Icon(Icons.directions_bike),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Text("Activity:", style: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              child: ReadMoreText(
                '世界各国の赤十字社・赤新月社とのネットワークを活かした日本赤十字社の国際活動は、各国で発生する紛争や自然災害により被害を受けた方々への救援活動、被災地や保健衛生の環境が整っていない地域等に対して中長期的に行う、伝染病予防教育、医療機器の整備、飲料水供給・衛生環境改善事業など多岐にわたります。',
                trimLines: 2,
                colorClickableText: Colors.red,
                style: TextStyle(color: Colors.black),
                lessStyle: TextStyle(color: Colors.green),
                moreStyle: TextStyle(color: Colors.green),
                trimMode: TrimMode.Line,
                trimCollapsedText: ' ...さらに表示',
                trimExpandedText: '\n折りたたむ',
                delimiter: "",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _requirementRow() {
    return _baseRow(
      Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Icon(Icons.settings),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Text("Requirement:", style: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              child: ReadMoreText(
                '国内外の大学院、大学、高等専門学校を卒業・修了（見込み）の方',
                trimLines: 1,
                colorClickableText: Colors.red,
                style: TextStyle(color: Colors.black),
                lessStyle: TextStyle(color: Colors.green),
                moreStyle: TextStyle(color: Colors.green),
                trimMode: TrimMode.Line,
                trimCollapsedText: ' ...さらに表示',
                trimExpandedText: '\n折りたたむ',
                delimiter: "",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _remarksRow() {
    return _baseRow(
      Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Icon(Icons.note),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Text("Remark:", style: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              child: ReadMoreText(
                '「備考」とは、参考のために付記すること、またはその事柄や記事のことです。参考として文章や注書きを書き加えることを意味します。本文内に書くほどではないが大切な説明やデータ、書き加えることで元の文章がわかりにくくなる場合の注意事項が付記されることがあります。また、「備考欄」には正規の記入欄に該当の箇所がない内容などを書くときなどに使われます。',
                trimLines: 3,
                colorClickableText: Colors.red,
                style: TextStyle(color: Colors.black),
                lessStyle: TextStyle(color: Colors.green),
                moreStyle: TextStyle(color: Colors.green),
                trimMode: TrimMode.Line,
                trimCollapsedText: ' ...さらに表示',
                trimExpandedText: '\n折りたたむ',
                delimiter: "",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _baseRow(Widget _child) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: _rowMarginVertical),
      child: _child,
    );
  }
}
