require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "weibox"


layout=--常规框架
{
  LinearLayout;--线性控件
  orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background=卡片色;--布局背景
  --状态栏开始
  {
    LinearLayout;--线性控件
    orientation='horizontal';--布局方向
    layout_width='fill';--布局宽度
    layout_height=获取状态栏高度();--布局高度
    background=顶栏背景色;--布局背景
  };
  --状态栏结束
  --顶栏开始
  {
    LinearLayout;--线性控件
    orientation='horizontal';--布局方向
    layout_width='fill';--布局宽度
    layout_height='60dp';--布局高度
    background=顶栏背景色;--布局背景
    gravity='center';--控件内容的重力方向
    --左:left 右:right 中:center 顶:top 底:bottom
    --返回按钮开始
    {
      LinearLayout;--线性控件
      orientation='horizontal';--布局方向
      layout_width='30dp';--布局宽度
      layout_height='30dp';--布局高度
      gravity='center';--控件内容的重力方向
      --左:left 右:right 中:center 顶:top 底:bottom
      id='back';--控件ID
      layout_margin='10dp';--控件外边距
      {
        ImageView;--图片控件
        layout_width='25dp';--图片宽度
        layout_height='25dp';--图片高度
        src='drawable/arrow_back_black.png';--图片路径
        --id='Image';--设置控件ID
        ColorFilter=顶栏主文本色;--图片着色
        --ColorFilter=Color.BLUE;--设置图片着色
        scaleType='fitXY';--图片拉伸
        layout_gravity='center';--重力
      };
    };
    --返回按钮结束
    --标题开始
    {
      LinearLayout;--线性控件
      orientation='vertical';--布局方向
      layout_width='fill';--布局宽度
      layout_height='55dp';--布局高度
      gravity='center';--控件内容的重力方向
      --左:left 右:right 中:center 顶:top 底:bottom
      layout_margin='5dp';--控件外边距
      layout_weight='1';--权重值
      {
        TextView;--文本控件
        layout_width='fill';--控件宽度
        layout_height='wrap';--控件高度
        text='收藏功能';--显示文字
        textSize='18sp';--文字大小
        textColor=顶栏主文本色;--文字颜色
        id='title';--设置控件ID
        singleLine=true;--设置单行输入
        ellipsize='end';--多余文字用省略号显示
        --start 开始 middle 中间 end 结尾
        --Typeface=Typeface.DEFAULT;--字体
        --textIsSelectable=true;--文本可复制
        --style="?android:attr/buttonBarButtonStyle";--点击特效
        gravity='center|left';--重力
        --左:left 右:right 中:center 顶:top 底:bottom
      };
    };
    --标题结束
  };
  --顶栏结束
  {
    TextView;--横向分割线
    layout_width='fill';--分割线宽度
    layout_height='2px';--分割线厚度
    layout_gravity='center';--高度居中
    backgroundColor=分割线色;--分割线颜色
  };
  {
    GridView;--网格适配器
    layout_width='fill';--宽度
    layout_height='fill';--高度
    id="grid";
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
    id='none';--设置控件ID
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
}

activity.setContentView(loadlayout(layout))

波纹(back,转0x(波纹色))
back.onClick=function()
  退出页面()
end


item={
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



local data=获取所有收藏("收藏")
local keys=收藏标题(data)
local values=收藏内容(data)
local adpd=收藏适配器数据(keys)

adp=LuaAdapter(activity,adpd,item)--设置适配器
grid.setAdapter(adp)

grid.onItemClick=function(l,v,p,i)--列表适配器点击事件
  pcall(load(values[i]))
end

grid.onItemLongClick=function(l,v,p,i)--列表适配器长按事件
  local dialog=AlertDialog.Builder(this)
  .setTitle("收藏")
  .setMessage("要将"..v.Tag.title.text.."从收藏中移除吗？")
  .setPositiveButton("确定",function()
    删除收藏("收藏",keys[i])
    adp.remove(p)
    table.remove(keys,i)
    table.remove(values,i)
    弹出SnackBar("已将"..v.Tag.title.text.."从收藏中移除")
  end)
  .setNegativeButton("取消",nil)
  .show()
  dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(转0x(主题色))
  dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(转0x(主题色))
end

if(#keys==0)then
  none.setVisibility(View.VISIBLE)
  grid.setVisibility(View.GONE)
 else
  none.setVisibility(View.GONE)
  grid.setVisibility(View.VISIBLE)
end