import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:srdrbk/components/widgets/signature_widget.dart';
import 'package:srdrbk/core/analytics/analytics_service.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/config/localization/locale_keys.g.dart';
import 'package:srdrbk/core/constants/constants.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';
import 'package:srdrbk/core/theme/text_styles/app_text_styles.dart';
import 'package:srdrbk/main_page/data/model/blog.dart';
import 'package:web/web.dart' as html;

class BlogsSection extends StatefulWidget {
  const BlogsSection({super.key, required this.list});

  final List<Blog> list;

  @override
  State<BlogsSection> createState() => _BlogsSectionState();
}

class _BlogsSectionState extends State<BlogsSection> {
  // bool _showAll = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (widget.list.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 64),
      color: BaseFunctions.isDarkMode(context)
          ? AppColors.grayDark50
          : AppColors.grayLight50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Chip(
            label: Text(
              LocaleKeys.blogs.tr(),
              style: AppTextStyles.allBody3Medium.copyWith(
                color: BaseFunctions.isDarkMode(context)
                    ? AppColors.grayDark600
                    : AppColors.grayLight600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 32),
            child: Text(
              LocaleKeys.blogsDescription.tr(),
              style: AppTextStyles.mobileTabletSubtitleNormal.copyWith(
                color: BaseFunctions.isDarkMode(context)
                    ? AppColors.grayDark600
                    : AppColors.grayLight600,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...widget.list.map(
                  (blog) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: _BlogCard(blog: blog),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BlogCard extends StatelessWidget {
  const _BlogCard({required this.blog});

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (blog.link != null && blog.link!.isNotEmpty) {
            html.window.open(blog.link!, "_blank");
            AnalyticsService.logEvent(
              "${blog.title}_Blog_Clicked",
              {"view": Constants.mobileBlogs},
            );
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: BaseFunctions.isDarkMode(context)
                ? AppColors.grayDark100
                : AppColors.grayLight100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Preview image
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: blog.image != null && blog.image!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: blog.image!,
                          fit: BoxFit.cover,
                          // placeholder: (_, __) => Container(
                          //   color: BaseFunctions.isDarkMode(context)
                          //       ? AppColors.grayDark200
                          //       : AppColors.grayLight200,
                          //   child: Center(
                          //     child: SizedBox(
                          //       width: 16,
                          //       height: 16,
                          //       child: CircularProgressIndicator(
                          //         strokeWidth: 2,
                          //         color: BaseFunctions.isDarkMode(context)
                          //             ? AppColors.grayDark600
                          //             : AppColors.grayLight600,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // errorWidget: (_, __, ___) =>
                          //     _buildPlaceholderImage(context),
                          errorWidget: (_, __, ___) => const SignatureWidget(),
                          placeholder: (_, __) => const SignatureWidget(),
                        )
                      : _buildPlaceholderImage(context),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      blog.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppTextStyles.mobileTabletSubtitleSemiBold.copyWith(
                        color: BaseFunctions.isDarkMode(context)
                            ? AppColors.grayDark900
                            : AppColors.grayLight900,
                      ),
                    ),
                    if ((blog.subtitle ?? '').isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          blog.subtitle ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.allBody3Normal.copyWith(
                            color: BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark600
                                : AppColors.grayLight600,
                          ),
                        ),
                      ),
                    if ((blog.publishedAt ?? '').isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          _formatDate(blog.publishedAt ?? ""),
                          style: AppTextStyles.allBody3Medium.copyWith(
                            color: BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark400
                                : AppColors.grayLight400,
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            LocaleKeys.readMore.tr(),
                            style: AppTextStyles.allBody3Medium.copyWith(
                              color: AppColors.emerald,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.arrow_outward,
                            size: 14,
                            color: AppColors.emerald,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage(BuildContext context) {
    return Container(
      color: BaseFunctions.isDarkMode(context)
          ? AppColors.grayDark200
          : AppColors.grayLight200,
      child: Center(
        child: Icon(
          Icons.article_outlined,
          size: 32,
          color: BaseFunctions.isDarkMode(context)
              ? AppColors.grayDark400
              : AppColors.grayLight400,
        ),
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat.yMMMM().format(date);
    } catch (e) {
      return dateStr;
    }
  }
}
