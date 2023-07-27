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
        text='全部功能';--显示文字
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
    {
      EditText;--编辑框控件
      layout_width='50%w';--控件宽度
      layout_height='wrap';--控件高度
      id='edit';--设置控件ID
      Hint='请输入搜索关键词';--编辑框内容为空时提示文字
      hintTextColor=顶栏辅文本色;--提示文字颜色
      textSize='16sp';--本文大小
      textColor=顶栏主文本色;--本文颜色
      gravity='left';--重力
      background='#00ffffff';--底条透明
      --Error='请输入';--气泡提示
      --ellipsize='end';--多余文字用省略号显示
      --start 开始 middle 中间 end 结尾
      singleLine=true;--设置单行输入，禁止换行
      --imeOptions='actionSearch';--设置回车键搜索,必须开启单行输入才能生效
      --actionGo(前往) actionDone(完成) actionNext(下一项) actionSearch(搜索) actionSend(发送)
      --minLines=2;--默认占用的行数
      --MaxLines=5;--设置最大输入行数
      --MaxEms=5;--设置每行最大宽度为五个字符的宽度
      --maxLength="10",--限制最多输入文字个数
      --password=true;--开启密码类型，自动隐藏为*号
      --InputType='number';--设置只可输入数字
      --cursorVisible=false;--隐藏光标
      --focusable=false;--禁止获得焦点,会无法编辑
      --focusableInTouchMode=false,--禁止弹出输入法
    };
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


adp=LuaAdapter(activity,data,item)--设置适配器
grid.setAdapter(adp)

import "list"

function 不搜索()
  for i=1,#功能列表 do
    adp.add{title=功能列表[i][2],linear={background=列表波纹(转0x(波纹色))}}
  end
  grid.onItemClick=function(l,v,p,i)--列表适配器点击事件
    pcall(load(功能列表[i][4]))
  end
  grid.onItemLongClick=function(l,v,p,i)--列表适配器长按事件
    if not 获取收藏("收藏",功能列表[i][2]) then
      local dialog=AlertDialog.Builder(this)
      .setTitle("收藏")
      .setMessage("要将"..功能列表[i][2].."添加到收藏中吗？")
      .setPositiveButton("确定",function()
        添加收藏("收藏",功能列表[i][2],string.dump(功能列表[i][4]))
        弹出SnackBar("已将"..功能列表[i][2].."添加到收藏中")
      end)
      .setNegativeButton("取消",nil)
      .show()
      dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(转0x(主题色))
      dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(转0x(主题色))
     else
      弹出SnackBar("该功能已在收藏中")
    end
  end
end

function 搜索(关键词)
  j=1--记录搜索结果的索引
  name={}--记录搜索结果的名称
  value={}--记录搜索结果的点击事件
  for i=1,#功能列表 do
    if(string.lower(功能列表[i][2]):match(string.lower(关键词)))then
      adp.add{title=功能列表[i][2],linear={background=列表波纹(转0x(波纹色))}}
      name[j]=功能列表[i][2]
      value[j]=功能列表[i][4]
      j=j+1
    end
  end
  grid.onItemClick=function(l,v,p,i)--列表适配器点击事件
    pcall(load(value[i]))
  end
  grid.onItemLongClick=function(l,v,p,i)--列表适配器长按事件
    if not 获取收藏("收藏",name[i]) then
      local dialog=AlertDialog.Builder(this)
      .setTitle("收藏")
      .setMessage("要将"..name[i].."添加到收藏中吗？")
      .setPositiveButton("确定",function()
        添加收藏("收藏",name[i],string.dump(value[i]))
        弹出SnackBar("已将"..name[i].."添加到收藏中")
      end)
      .setNegativeButton("取消",nil)
      .show()
      dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(转0x(主题色))
      dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(转0x(主题色))
     else
      弹出SnackBar("该功能已在收藏中")
    end
  end
end

不搜索()

edit.addTextChangedListener{
  onTextChanged=function(s)
    adp.clear()
    if(s==nil or tostring(s)=="")then--如果为空则不搜索
      不搜索()
     else
      搜索(tostring(s))
    end
  end
}