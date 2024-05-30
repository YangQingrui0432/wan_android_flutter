import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android_flutter/common_ui/common_style.dart';
import 'package:wan_android_flutter/common_ui/smart_refresh/smart_refresh_widget.dart';
import 'package:wan_android_flutter/module/home/home_vm.dart';
import 'package:wan_android_flutter/module/home/repository/data/home_article_data.dart';
import 'package:wan_android_flutter/route/route_utils.dart';
import 'package:wan_android_flutter/route/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel = HomeViewModel();
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();

    viewModel.getBanner();
    refreshOrLoadMore(false);
  }

  void refreshOrLoadMore(bool loadMore) {
    viewModel.getAllArticleList(loadMore, callback: (loadMore) {
      if (loadMore) {
        refreshController.loadComplete();
      } else {
        refreshController.refreshCompleted();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
        create: (context) {
          return viewModel;
        },
        child: Scaffold(
          body: SafeArea(
            child: SmartRefreshWidget(
                controller: refreshController,
                onRefresh: () {
                  viewModel.getBanner().then((value) {
                    refreshOrLoadMore(false);
                  });
                },
                onLoading: () {
                  refreshOrLoadMore(true);
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [_banner(), _listView()],
                  ),
                )),
          ),
        ));
  }

  Widget _banner() {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return SizedBox(
        width: double.infinity,
        height: 200,
        child: Swiper(
          itemCount: vm.bannerList?.length ?? 0,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white30,
              child: Image.network(
                vm.bannerList?[index].imagePath ?? "",
                fit: BoxFit.cover,
              ),
            );
          },
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
          autoplay: true,
        ),
      );
    });
  }

  Widget _listView() {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _listViewItem(vm.articleList[index]);
        },
        itemCount: vm.articleList.length,
      );
    });
  }

  Widget _listViewItem(HomeArticleItemData? data) {
    String? author;
    if (data?.author?.isNotEmpty == true) {
      author = data?.author;
    } else {
      author = data?.shareUser;
    }

    String chapter =
        "${data?.superChapterName ?? ""} / ${data?.chapterName ?? ""}";
    if (chapter.isNotEmpty == true && chapter.endsWith(" / ")) {
      chapter.replaceRange(chapter.length - 2, null, "");
    }

    bool collect = data?.collect ?? false;

    return articleListItem(
      type: data?.type ?? 0,
      collect: collect,
      title: data?.title,
      chapter: chapter,
      dateText: data?.niceShareDate,
      author: author,
      onTap: () {
        RouteUtils.pushForNamed(context, RoutePath.webViewPage,
            arguments: {"name": data?.title ?? ""});
      },
    );
  }
}
