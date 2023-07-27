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
    --菜单按钮开始
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
        text='设置';--显示文字
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
    ListView;--列表适配器
    layout_width='fill';--宽度
    layout_height='fill';--高度
    id="list";
    DividerHeight=0;--分割线高度0为无隔断线
    --verticalScrollBarEnabled=false;--隐藏滑条
  };
}

activity.setContentView(loadlayout(layout))


波纹(back,转0x(波纹色))
back.onClick=function()
  退出页面()
  activity.newActivity("main.lua")--建议重载主窗口
end

item={
  {--标题 (type1)
    LinearLayout;--线性控件
    orientation='horizontal';--布局方向
    layout_width='fill';--布局宽度
    layout_height='wrap';--布局高度
    onClick=function()end;--防止标题被点击
    {
      TextView;--文本控件
      layout_width='wrap';--控件宽度
      layout_height='wrap';--控件高度
      text='';--显示文字
      textSize='14sp';--文字大小
      textColor=主题色;--文字颜色
      id='title';--设置控件ID
      --singleLine=true;--设置单行输入
      --ellipsize='end';--多余文字用省略号显示
      --start 开始 middle 中间 end 结尾
      --Typeface=Typeface.DEFAULT;--字体
      --textIsSelectable=true;--文本可复制
      --style="?android:attr/buttonBarButtonStyle";--点击特效
      gravity='center|left';--重力
      --左:left 右:right 中:center 顶:top 底:bottom
      layout_margin='10dp';--控件外边距
    };
  };
  {--带开关项目 (type2)
    LinearLayout;--线性控件
    orientation='horizontal';--布局方向
    layout_width='fill';--布局宽度
    layout_height='wrap';--布局高度
    gravity='center';--控件内容的重力方向
    --左:left 右:right 中:center 顶:top 底:bottom
    padding='5dp';--控件内边距
    {
      ImageView;--图片控件
      layout_width='30dp';--图片宽度
      layout_height='30dp';--图片高度
      --src=''-图片路径
      id='icon';--设置控件ID
      ColorFilter=主题色;--图片着色
      --ColorFilter=Color.BLUE;--设置图片着色
      scaleType='fitXY';--图片拉伸
      layout_gravity='center';--重力
      layout_margin='10dp';--控件外边距
    };
    {
      TextView;--文本控件
      layout_width='fill';--控件宽度
      layout_height='wrap';--控件高度
      text='';--显示文字
      textSize='18sp';--文字大小
      textColor=主文本色;--文字颜色
      id='title';--设置控件ID
      --singleLine=true;--设置单行输入
      --ellipsize='end';--多余文字用省略号显示
      --start 开始 middle 中间 end 结尾
      --Typeface=Typeface.DEFAULT;--字体
      --textIsSelectable=true;--文本可复制
      --style="?android:attr/buttonBarButtonStyle";--点击特效
      gravity='center|left';--重力
      --左:left 右:right 中:center 顶:top 底:bottom
      layout_margin='10dp';--控件外边距
      layout_weight='1';--权重值分配
    };
    {
      Switch;--开关控件
      layout_width='wrap';--控件宽度
      layout_height='wrap';--控件高度
      id='check';--设置控件ID
      --text='本文内容';--显示文字
      --textSize='16sp';--文字大小
      --textColor='#333333';--文字颜色
      gravity='center';--重力
      --SwitchMinWidth='0dp';--开关最小宽度
      --SwitchPadding='0dp';--开关与文字的间距
      --showText=true;--开关上是否显示文字
      --checked=true;--代码中设置复选框初始化状态
      --enabled=false ;--设置复选框为灰色,默认不可点击
      clickable=false;--设置复选框为彩色，默认不可点击
      Focusable=false;
      layout_margin='10dp';--控件外边距
    };
  };
  {--仅文本项目 (type3)
    LinearLayout;--线性控件
    orientation='horizontal';--布局方向
    layout_width='fill';--布局宽度
    layout_height='wrap';--布局高度
    gravity='center|left';--控件内容的重力方向
    --左:left 右:right 中:center 顶:top 底:bottom
    padding='5dp';--控件内边距
    {
      ImageView;--图片控件
      layout_width='30dp';--图片宽度
      layout_height='30dp';--图片高度
      --src=''-图片路径
      id='icon';--设置控件ID
      ColorFilter=主题色;--图片着色
      --ColorFilter=Color.BLUE;--设置图片着色
      scaleType='fitXY';--图片拉伸
      layout_gravity='center';--重力
      layout_margin='10dp';--控件外边距
    };
    {
      TextView;--文本控件
      layout_width='wrap';--控件宽度
      layout_height='wrap';--控件高度
      text='';--显示文字
      textSize='18sp';--文字大小
      textColor=主文本色;--文字颜色
      id='title';--设置控件ID
      --singleLine=true;--设置单行输入
      --ellipsize='end';--多余文字用省略号显示
      --start 开始 middle 中间 end 结尾
      --Typeface=Typeface.DEFAULT;--字体
      --textIsSelectable=true;--文本可复制
      --style="?android:attr/buttonBarButtonStyle";--点击特效
      gravity='center';--重力
      --左:left 右:right 中:center 顶:top 底:bottom
      layout_margin='10dp';--控件外边距
    };
  };
  {--分割线 (type4)
    LinearLayout;--线性控件
    orientation='horizontal';--布局方向
    layout_width='fill';--布局宽度
    layout_height='wrap';--布局高度
    onClick=function()end;--防止分割线被点击
    {
      TextView;--横向分割线
      layout_width='fill';--分割线宽度
      layout_height='2px';--分割线厚度
      layout_gravity='center';--高度居中
      backgroundColor=分割线色;--分割线颜色
      layout_marginTop='10dp';--布局顶距
      layout_marginBottom='10dp';--布局底距
    };
  };
};

--列表适配器
adp=LuaMultiAdapter(activity,item)
list.setAdapter(adp)

adp.add{__type=3,title="启动页切换",icon="drawable/home_black.png"}
adp.add{__type=3,title="外观风格",icon="drawable/pages_black.png"}
adp.add{__type=3,title="主题配色",icon="drawable/color_lens_black.png"}
adp.add{__type=3,title="深色模式",icon="drawable/brightness_6_black.png"}

list.setOnItemClickListener(AdapterView.OnItemClickListener{
  onItemClick=function(l,v,p,i)
    --项目点击事件
    if(v.Tag.title.text=="启动页切换")then
      local items={"收藏","功能","发现"}
      local choose=activity.getSharedData("启动页")
      local dialog=AlertDialog.Builder(this)
      .setTitle("启动页切换")
      .setSingleChoiceItems(items,choose,{onClick=function(v,p)
          choose=p
        end})
      .setPositiveButton("确定",function()
        activity.setSharedData("启动页",choose)
        activity.recreate()
      end)
      .setNegativeButton("取消",nil)
      .show()
      dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(转0x(主题色))
      dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(转0x(主题色))
    end
    if(v.Tag.title.text=="外观风格")then
      activity.newActivity("sub/style.lua")
      退出页面()
    end
    if(v.Tag.title.text=="主题配色")then
      activity.newActivity("sub/theme.lua")
      退出页面()
    end
    if(v.Tag.title.text=="深色模式")then
      local items={"跟随系统","浅色","深色"}
      local choose=activity.getSharedData("深色模式")
      local dialog=AlertDialog.Builder(this)
      .setTitle("深色模式切换")
      .setSingleChoiceItems(items,choose,{onClick=function(v,p)
          choose=p
        end})
      .setPositiveButton("确定",function()
        activity.setSharedData("深色模式",choose)
        activity.recreate()
      end)
      .setNegativeButton("取消",nil)
      .show()
      dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(转0x(主题色))
      dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(转0x(主题色))
    end
  end
})

--返回键
function onKeyDown(code,event)
  if(code==4)then
    退出页面()
    activity.newActivity("main.lua")--建议重载主窗口
  end
end