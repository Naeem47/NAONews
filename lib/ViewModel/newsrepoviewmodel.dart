import 'package:news/Model/CAtegoryNewsModel.dart';
import 'package:news/Model/Headlinemodel.dart';
import 'package:news/Model/healinemodelus.dart';
import 'package:news/repositrey/newsrepo.dart';

class NewsRepoViewModel{
  final _REPO = NewsRepo();
  Future <HeadlineModel> fetchheadline()async{
    final response = await _REPO.fetchheadline();
    return response;
  }
  Future <HeadlineModelUS> fetchheadlineus()async{
    final response = await _REPO.fetchheadlineus();
    return response;
  }
  Future <CategoryNewsModel> fetchCategoryNews(String category)async{
    final response = await _REPO.fetchCategoryNews(category);
    return response;
  }
}