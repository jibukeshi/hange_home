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
        text='主题';--显示文字
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
  LinearLayout;--线性控件
  orientation='horizontal';--布局方向
  layout_width='fill';--布局宽度
  layout_height='wrap';--布局高度
  gravity='center';--控件内容的重力方向
  --左:left 右:right 中:center 顶:top 底:bottom
  {
    CardView;--卡片控件
    layout_width='30dp';--卡片宽度
    layout_height='30dp';--卡片高度
    cardBackgroundColor=卡片色;--卡片颜色
    layout_margin='10dp';--卡片边距
    cardElevation='0dp';--卡片阴影
    radius='50dp';--卡片圆角
    id='card';--设置控件ID
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
    ImageView;--图片控件
    layout_width='30dp';--图片宽度
    layout_height='30dp';--图片高度
    src='drawable/check_black.png';--图片路径
    id='check';--设置控件ID
    ColorFilter=主题色;--图片着色
    --ColorFilter=Color.BLUE;--设置图片着色
    scaleType='fitXY';--图片拉伸
    layout_gravity='center';--重力
    layout_margin='10dp';--控件外边距
  };
};

theme={
  {"默认蓝","#FF5187F4"},
  {"中国红","#FFDC4437"},
  {"哔哩粉","#FFFA7298"},
  {"亮橙色","#FFFF8932"},
  {"香蕉黄","#FFFFBB34"},
  {"酷安绿","#FF109D58"},
  {"水鸭青","#FF009788"},
  {"天蓝色","#FF2196F3"},
  {"深海蓝","#FF4169E2"},
  {"亮紫色","#FFAA66CD"},
  {"基佬紫","#FF673BB7"},
  {"自定义",主题色},
};

if(activity.getSharedData("外观风格")==1)then
  theme[1][1]="函鸽绿"
  theme[1][2]="#FF78BF9A"
end

--列表适配器
adp=LuaAdapter(activity,data,item)--设置适配器
list.setAdapter(adp)
for i=1,#theme do
  if(theme[i][1]==主题配置)then
    状态=0
   else
    状态=8
  end
  adp.add{
    card={
      CardBackgroundColor=转0x(theme[i][2]),
    },
    title={
      text=theme[i][1],
      textColor=转0x(theme[i][2]),
    },
    check={
      colorFilter=转0x(theme[i][2]),
      Visibility=状态,
    },
  }
end

list.setOnItemClickListener(AdapterView.OnItemClickListener{
  onItemClick=function(l,v,p,i)
    --项目点击事件
    if(v.Tag.title.text=="自定义")then
      local dialog=AlertDialog.Builder(this)
      .setTitle("自定义主题色")
      .setView(loadlayout(
      {
        LinearLayout;--线性控件
        orientation='horizontal';--布局方向
        layout_width='fill';--布局宽度
        layout_height='fill';--布局高度
        gravity='center';--重力
        --左:left 右:right 中:center 顶:top 底:bottom
        {
          TextInputLayout;
          layout_width='fill';--控件宽度
          layout_height='wrap';--控件高度
          Hint='请输入自定义颜色';--编辑框内容为空时提示文字
          id='input';--设置控件ID
          layout_margin='20dp';--控件外边距
          boxStrokeColor=主题色;
          helperText='请输入以#开头的16进制颜色代码，六位或八位均可！';
          {
            TextInputEditText;
            layout_width='fill';--控件宽度
            layout_height='fill';--控件高度
            id='edit';--设置控件ID
            text=主题色;--显示文字
            textSize='16sp';--本文大小
            textColor=主文本色;--本文颜色
            singleLine=true;--设置单行输入，禁止换行
            padding='15dp';--控件内边距
          };
        };
      }
      ))
      .setPositiveButton("确定",function()
        if((#edit.text==7 or #edit.text==9) and edit.text:find("#") and 0xFFFFFFFF>=转0x(edit.text) and 转0x(edit.text)>=0x00000000)then
          activity.setSharedData("主题","自定义")
          activity.setSharedData("主题色",edit.text)
          activity.recreate()
         else
          弹出SnackBar("输入格式有误")
        end
      end)
      .setNegativeButton("取消",nil)
      .show()
      --input.setDefaultHintTextColor(ColorStateList.valueOf(转0x(辅文本色)))
      input.setBoxBackgroundMode(2)
      input.setBoxCornerRadii(10,10,10,10)
      dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(转0x(主题色))
      dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(转0x(主题色))
     else
      activity.setSharedData("主题",theme[i][1])
      activity.setSharedData("主题色",theme[i][2])
      activity.recreate()
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