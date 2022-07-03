class Age{
  final bool isMale;

  Age({required this.isMale});

  int minAge(){
    if(isMale){
      return 21;
    }
    return 18;
  }
}