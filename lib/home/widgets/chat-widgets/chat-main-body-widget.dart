import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mine_loop_education/home/screens/chat-screen/chat-with-friend-screen.dart';
import 'package:mine_loop_education/home/widgets/chat-widgets/chat-main-card-widget.dart';

class ChatMainBodyWidget extends StatefulWidget {
  @override
  _ChatMainBodyWidgetState createState() => _ChatMainBodyWidgetState();
}

class _ChatMainBodyWidgetState extends State<ChatMainBodyWidget> {
  int _currentMax = 10;
  var _listChat = [
    ChatMainCardWidget(
      friendName: "new",
      message: "ESADS",
      circleAvatarUri: "nothing",
      id: "11",
    ),
    ChatMainCardWidget(
      friendName: "WE",
      message: "ASDASD",
      circleAvatarUri: "nothing",
      id: "22",
    ),
    ChatMainCardWidget(
      friendName: "wqeq",
      message: "ASDASD",
      circleAvatarUri: "nothing",
      id: "33",
    ),
    ChatMainCardWidget(
      friendName: "wqeq",
      message: "ASDASD",
      circleAvatarUri: "nothing",
      id: "111",
    ),
    ChatMainCardWidget(
      friendName: "wqeq",
      message: "ASDASD",
      circleAvatarUri: "nothing",
      id: "2",
    ),
    ChatMainCardWidget(
      friendName: "wqeq",
      message: "ASDASD",
      circleAvatarUri: "nothing",
      id: "55",
    ),
    ChatMainCardWidget(
      friendName: "wqeq",
      message: "ASDASD",
      circleAvatarUri: "nothing",
      id: "12",
    ),
    ChatMainCardWidget(
      friendName: "wqeq",
      message: "ASDASD",
      circleAvatarUri: "nothing",
      id: "123",
    ),
    ChatMainCardWidget(
      friendName: "wqeq",
      message: "ASDASD",
      circleAvatarUri: "nothing",
      id: "1234",
    ),
    ChatMainCardWidget(
      friendName: "wqeq",
      message: "ASDASD",
      circleAvatarUri: "nothing",
      id: "1212",
    ),
    ChatMainCardWidget(
      friendName: "wqeq",
      message: "ASDASD",
      circleAvatarUri: "nothing",
      id: "12134",
    ),
    ChatMainCardWidget(
      friendName: "wqeq",
      message: "ASDASD",
      circleAvatarUri: "nothing",
      id: "12123112",
    ),
    ChatMainCardWidget(
      friendName: "wqeq",
      message: "ASDASD",
      circleAvatarUri: "nothing",
      id: "12123134",
    ),
    ChatMainCardWidget(
      friendName: "wqeq",
      message: "ASDASD",
      circleAvatarUri: "nothing",
      id: "12126",
    ),
    ChatMainCardWidget(
      friendName: "wqeq",
      message: "ASDASD",
      circleAvatarUri: "nothing",
      id: "128134",
    ),
  ];

  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreList();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _loadMoreList() {
    for (int i = _currentMax; i < _currentMax + 10; i++) {
      _listChat.add(ChatMainCardWidget(
        friendName: "wqeq",
        message: "ASDASD",
        circleAvatarUri: "nothing",
        id: "128134$i",
      ));
    }
    _currentMax = _currentMax + 10;
    setState(() {});
  }

  void _onFavorite(int index) {
    final deletedItem = _listChat.removeAt(index);
    setState(() {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(
            "Favorite : $index",
          ),
          action: SnackBarAction(
            label: "UNDO",
            onPressed: () {
              setState(() {
                _listChat.insert(index, deletedItem);
              });
            },
          ),
        ));
    });
  }

  void _onDelete(int index) {
    final deletedItem = _listChat.removeAt(index);
    setState(() {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(
            "Deleted index: $index",
          ),
          action: SnackBarAction(
            label: "UNDO",
            onPressed: () {
              setState(() {
                _listChat.insert(index, deletedItem);
              });
            },
          ),
        ));
    });
  }

  void _onTap(String friendName) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => ChatWithFriendScreen(friendName: friendName)),
    );
  }

  Widget _alertBox(BuildContext ctx,
          {String title, String content, bool isDelete}) =>
      Container(
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(isDelete ? 'Delete' : 'Favorite')),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (_, snapshot) => ListView.builder(
        controller: _scrollController,
        itemExtent: 100,
        cacheExtent: 20,
        itemCount: _listChat.length + 1,
        itemBuilder: (ctx, index) => index == _listChat.length
            ? CupertinoActivityIndicator()
            : Column(
                children: [
                  Dismissible(
                    key: ValueKey(_listChat[index].id),
                    background: Container(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.white),
                            Text('Move to favorites',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.delete, color: Colors.white),
                            Text('Move to trash',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    child: InkWell(
                      onTap: () => _onTap(_listChat[index].friendName),
                      child: _listChat[index],
                    ),
                    confirmDismiss: (direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return direction == DismissDirection.startToEnd
                              ? _alertBox(ctx,
                                  title: "Favorite Confirmation",
                                  content:
                                      "Are you sure you want to Favorite this chat?",
                                  isDelete: false)
                              : _alertBox(ctx,
                                  title: "Delete Confirmation",
                                  content:
                                      "Are you sure you want to delete this chat?",
                                  isDelete: true);
                        },
                      );
                    },
                    onDismissed: (direction) =>
                        direction == DismissDirection.startToEnd
                            ? _onFavorite(index)
                            : _onDelete(index),
                  ),
                  Divider(),
                ],
              ),
      ),
    );
  }
}
