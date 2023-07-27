page1Layout=
{
  FrameLayout;--帧布局
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  {
    GridView;--网格适配器
    layout_width='fill';--宽度
    layout_height='fill';--高度
    id="page1_grid";
    numColumns=2;--列数
    --ColumnWidth='';--每一列的宽度
    --StretchMode='';--缩放
    --HorizontalSpacing='';--两列直接的边距
    --VerticalSpacing='';--两行之间的间距
    overScrollMode="";--去除滑动圆弧形
    verticalScrollBarEnabled=false;--隐藏滑条
    layout_margin='10dp';--控件外边距
    gravity='center';--控件内容的重力方向
    --左:left 右:right 中:center 顶:top 底:bottom
  };
  {
    LinearLayout;--线性控件
    orientation='vertical';--布局方向
    layout_width='fill';--布局宽度
    layout_height='fill';--布局高度
    gravity='center';--控件内容的重力方向
    --左:left 右:right 中:center 顶:top 底:bottom
    id='page1_none';--设置控件ID
    {
      TextView;--文本控件
      layout_width='wrap';--控件宽度
      layout_height='wrap';--控件高度
      text='暂无收藏';--显示文字
      textSize='18sp';--文字大小
      textColor=主文本色;--文字颜色
      --id='Text';--设置控件ID
      --singleLine=true;--设置单行输入
      --ellipsize='end';--多余文字用省略号显示
      --start 开始 middle 中间 end 结尾
      --Typeface=Typeface.DEFAULT;--字体
      --textIsSelectable=true;--文本可复制
      --style="?android:attr/buttonBarButtonStyle";--点击特效
      gravity='center';--重力
      --左:left 右:right 中:center 顶:top 底:bottom
      layout_margin='5dp';--控件外边距
    };
    {
      TextView;--文本控件
      layout_width='wrap';--控件宽度
      layout_height='wrap';--控件高度
      text='在功能页长按某个功能可将其添加到收藏中';--显示文字
      textSize='14sp';--文字大小
      textColor=辅文本色;--文字颜色
      --id='Text';--设置控件ID
      --singleLine=true;--设置单行输入
      --ellipsize='end';--多余文字用省略号显示
      --start 开始 middle 中间 end 结尾
      --Typeface=Typeface.DEFAULT;--字体
      --textIsSelectable=true;--文本可复制
      --style="?android:attr/buttonBarButtonStyle";--点击特效
      gravity='center';--重力
      --左:left 右:right 中:center 顶:top 底:bottom
      layout_margin='2dp';--控件外边距
    };
  };
};

page1.addView(loadlayout(page1Layout))


page1_item={
  CardView;--卡片控件
  layout_width='47.5%w';--卡片宽度
  layout_height='wrap';--卡片高度
  cardBackgroundColor=卡片色;--卡片颜色
  cardElevation='0dp';--卡片阴影
  {
    CardView;--卡片控件
    layout_width='fill';--卡片宽度
    layout_height='fill';--卡片高度
    cardBackgroundColor=背景色;--卡片颜色
    layout_margin='6dp';--卡片边距
    cardElevation='0dp';--卡片阴影
    radius='5dp';--卡片圆角
    {
      LinearLayout;--线性控件
      orientation='vertical';--布局方向
      layout_width='fill';--布局宽度
      layout_height='fill';--布局高度
      gravity='center';--控件内容的重力方向
      --左:left 右:right 中:center 顶:top 底:bottom
      id='linear';--控件ID
      {
        TextView;--文本控件
        layout_width='wrap';--控件宽度
        layout_height='wrap';--控件高度
        text='';--显示文字
        textSize='15sp';--文字大小
        textColor=主文本色;--文字颜色
        id='title';--设置控件ID
        --singleLine=true;--设置单行输入
        --ellipsize='end';--多余文字用省略号显示
        --start 开始 middle 中间 end 结尾
        --Typeface=Typeface.DEFAULT;--字体
        --textIsSelectbale=true;--文本可复制
        --style="?android:attr/buttonBarButtonStyle";--点击特效
        gravity='center';--重力
        --左:left 右:right 中:center 顶:top 底:bottom
        layout_margin='12.5dp';--控件外边距
      };
    };
  };
};


function 更新收藏()
  data=获取所有收藏("收藏")
  keys=收藏标题(data)
  values=收藏内容(data)
  adpd=收藏适配器数据(keys)
  page1_adp=LuaAdapter(activity,adpd,page1_item)--设置适配器
  page1_grid.setAdapter(page1_adp)
  if(#keys==0)then
    page1_none.setVisibility(View.VISIBLE)
    page1_grid.setVisibility(View.GONE)
   else
    page1_none.setVisibility(View.GONE)
    page1_grid.setVisibility(View.VISIBLE)
  end
end

page1_grid.onItemClick=function(l,v,p,i)--列表适配器点击事件
  pcall(load(values[i]))
end

page1_grid.onItemLongClick=function(l,v,p,i)--列表适配器长按事件
  local dialog=AlertDialog.Builder(this)
  .setTitle("收藏")
  .setMessage("要将"..v.Tag.title.text.."从收藏中移除吗？")
  .setPositiveButton("确定",function()
    删除收藏("收藏",keys[i])
    弹出SnackBar("已将"..v.Tag.title.text.."从收藏中移除")
    更新收藏()
  end)
  .setNegativeButton("取消",nil)
  .show()
  dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(转0x(主题色))
  dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(转0x(主题色))
end

更新收藏()