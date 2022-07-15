const newContentList = [];
newContentList[0] = res.data.data.slice(0, 9).filter((v) => {
  v.addtime = v.addtime.substring(0, 10);
  return v.sort !== 2;
});
newContentList[1] = res.data.data.slice(11, 20).filter((v) => {
  v.addtime = v.addtime.substring(0, 10);
  return v.sort !== 1;
});
this.contentList = newContentList;
