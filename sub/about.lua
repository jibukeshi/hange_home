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
  background=背景色;--布局背景
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
        text='关于';--显示文字
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
    ScrollView;--纵向滑动控件
    layout_width='fill';--布局宽度
    layout_height='fill';--布局高度
    verticalScrollBarEnabled=false;--隐藏纵向滑条
    overScrollMode=View.OVER_SCROLL_NEVER,--隐藏圆弧阴影
    {
      LinearLayout;--线性控件
      orientation='vertical';--布局方向
      layout_width='fill';--布局宽度
      layout_height='fill';--布局高度
      gravity='top|center';--控件内容的重力方向
      --左:left 右:right 中:center 顶:top 底:bottom
      {
        MaterialCardView;--卡片控件
        layout_width='90%w';--卡片宽度
        layout_height='wrap';--卡片高度
        cardBackgroundColor=卡片色;--卡片颜色
        layout_margin='10dp';--卡片边距
        cardElevation='0dp';--卡片阴影
        radius='5dp';--卡片圆角
        strokeWidth='1dp';--边框宽度
        strokeColor=分割线色;--边框颜色
        {
          LinearLayout;--线性控件
          orientation='vertical';--布局方向
          layout_width='fill';--布局宽度
          layout_height='fill';--布局高度
          layout_margin='10dp';--控件外边距
          {
            ImageView;--图片控件
            layout_width='70dp';--图片宽度
            layout_height='70dp';--图片高度
            src=应用图标;--图片路径
            --id='Image';--设置控件ID
            --ColorFilter='';--图片着色
            --ColorFilter=Color.BLUE;--设置图片着色
            scaleType='fitXY';--图片拉伸
            layout_gravity='center';--重力
            layout_margin='10dp';--控件外边距
          };
          {
            TextView;--文本控件
            layout_width='fill';--控件宽度
            layout_height='wrap';--控件高度
            text=应用名称;--显示文字
            textSize='22sp';--文字大小
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
            typeface=Typeface.DEFAULT_BOLD;--文本显示类型
          };
          {
            TextView;--文本控件
            layout_width='fill';--控件宽度
            layout_height='wrap';--控件高度
            text=应用标语;--显示文字
            textSize='16sp';--文字大小
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
            layout_margin='5dp';--控件外边距
          };
        };
      };
      {
        MaterialCardView;--卡片控件
        layout_width='90%w';--卡片宽度
        layout_height='wrap';--卡片高度
        cardBackgroundColor=卡片色;--卡片颜色
        layout_margin='10dp';--卡片边距
        cardElevation='0dp';--卡片阴影
        radius='5dp';--卡片圆角
        strokeWidth='1dp';--边框宽度
        strokeColor=分割线色;--边框颜色
        {
          TextView;--文本控件
          layout_width='fill';--控件宽度
          layout_height='wrap';--控件高度
          text="测试一下";--显示文字
          textSize='16sp';--文字大小
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
          layout_margin='5dp';--控件外边距
        };
      };
    };
  };
}

activity.setContentView(loadlayout(layout))


波纹(back,转0x(波纹色))
back.onClick=function()
  退出页面()
end
