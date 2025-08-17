import 'package:bookly_project/core/utils/services_locator.dart';
import 'package:bookly_project/features/Search/presentation/view/search_view.dart';
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_project/features/home/data/models/book_model/repos/home_repo_imp.dart';
import 'package:bookly_project/features/home/presentation/manager/similar_boo_cubit/similar_book_cubit.dart';
import 'package:bookly_project/features/home/presentation/view/book_details_view.dart';
import 'package:bookly_project/features/home/presentation/view/home_view.dart';
import 'package:bookly_project/features/home/presentation/view/widget/home_view_body.dart';
import 'package:bookly_project/features/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const KHomeView = '/homeView';
  static const KBookDetailsView = '/BookDetailsView';
  static const KSearch = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: KHomeView, builder: (context, state) => const HomeView()),

      GoRoute(path: KSearch, builder: (context, state) => const SearchView()),

      GoRoute(
        path: KBookDetailsView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SimilarBookCubit(getIt.get<HomeRepoImp>()),
              child: BookDetailsView(bookModel: state.extra as BookModel),
            ),
      ),
    ],
  );
}
