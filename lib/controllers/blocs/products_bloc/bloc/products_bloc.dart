import 'package:bloc/bloc.dart';
import 'package:ecommers/controllers/api/products_api.dart';
import 'package:ecommers/models/products_model.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ApiService apiService;

  ProductsBloc(this.apiService) : super(ProductsLoading()) {
    on<FetchProducts>(_onFetchProducts);
  }

  Future<void>_onFetchProducts(
    FetchProducts event,Emitter<ProductsState>emit)async{
      emit(ProductsLoading());

      try{
        final products=await apiService.fetchProducts();
        emit(ProductLoaded(products));
      }catch(e){
        print("Error fetching products: $e");
        emit(ProductError('Failed to load products'));
      }
    }
  }



