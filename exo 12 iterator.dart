class MyList implements Iterator{
late List tab ;
int pointer = -1;
  MyList(this.tab);

  @override
  get current => tab[pointer];

  @override
  bool moveNext() {
    if(tab.length == pointer+1){
      pointer = -1;
      return false;
    }else{
      pointer ++;
      return true;
    }

  }

}


main(){
 final ml =  MyList([1,2,3,4]);

  while(ml.moveNext()){
    print(ml.current);
  }
}