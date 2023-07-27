page2Layout=
{
  ScrollView,
  layout_width='fill';
  layout_height='fill';
  verticalScrollBarEnabled=false;--隐藏纵向滑条
  overScrollMode=View.OVER_SCROLL_NEVER,--隐藏圆弧阴影
  {
    LinearLayout;--线性控件
    orientation='vertical';--布局方向
    layout_width='fill';--布局宽度
    layout_height='fill';--布局高度
    id='page2linear';--设置控件ID
    layoutTransition=LayoutTransition()
    .enableTransitionType(LayoutTransition.CHANGING)
    .setDuration(LayoutTransition.CHANGE_APPEARING,300)
    .setDuration(LayoutTransition.CHANGE_DISAPPEARING,300),
  };
}

page2.addView(loadlayout(page2Layout))


function 展开(v)
  activity.setSharedData("page2"..v.."展开",true)
  _ENV["page2"..v.."flow"].setVisibility(View.VISIBLE)
  _ENV["page2"..v.."arrow"].setImageBitmap(loadbitmap("drawable/keyboard_arrow_down_black.png"))
end
function 折叠(v)
  activity.setSharedData("page2"..v.."展开",false)
  _ENV["page2"..v.."flow"].setVisibility(View.GONE)
  _ENV["page2"..v.."arrow"].setImageBitmap(loadbitmap("drawable/keyboard_arrow_right_black.png"))
end

function 添加第二页功能组(编号,名称,图标,颜色)
  --初始化折叠状态
  if(activity.getSharedData("page2"..编号.."展开")==nil)then
    activity.setSharedData("page2"..编号.."展开",true)
  end
  功能组布局={
    LinearLayout;--线性控件
    orientation='vertical';--布局方向
    layout_width='fill';--布局宽度
    layout_height='wrap';--布局高度
    {
      CardView;--卡片控件
      layout_width='fill';--卡片宽度
      layout_height='wrap';--卡片高度
      cardBackgroundColor=卡片色;--卡片颜色
      cardElevation='0dp';--卡片阴影
      radius='0dp';--卡片圆角
      id='page2'..编号;--设置控件ID
      {
        LinearLayout;--线性控件
        orientation='vertical';--布局方向
        layout_width='fill';--布局宽度
        layout_height='wrap';--布局高度
        gravity='center';--控件内容的重力方向
        --左:left 右:right 中:center 顶:top 底:bottom
        layoutTransition=LayoutTransition()
        .enableTransitionType(LayoutTransition.CHANGING)
        .setDuration(LayoutTransition.CHANGE_APPEARING,300)
        .setDuration(LayoutTransition.CHANGE_DISAPPEARING,300),
        {
          LinearLayout;--线性控件
          orientation='horizontal';--布局方向
          layout_width='fill';--布局宽度
          layout_height='wrap';--布局高度
          gravity='center';--控件内容的重力方向
          --左:left 右:right 中:center 顶:top 底:bottom
          layout_margin='10dp';--控件外边距
          id='page2'..编号..'title';--设置控件ID
          {
            ImageView;--图片控件
            layout_width='25dp';--图片宽度
            layout_height='25dp';--图片高度
            src=图标;--图片路径
            --id='Image';--设置控件ID
            ColorFilter=颜色;--图片着色
            --ColorFilter=Color.BLUE;--设置图片着色
            scaleType='fitXY';--图片拉伸
            layout_gravity='center';--重力
            layout_margin='5dp';--控件外边距
          };
          {
            TextView;--文本控件
            layout_width='fill';--控件宽度
            layout_height='wrap';--控件高度
            text=名称;--显示文字
            textSize='16sp';--文字大小
            textColor=颜色;--文字颜色
            --id='Text';--设置控件ID
            --singleLine=true;--设置单行输入
            --ellipsize='end';--多余文字用省略号显示
            --start 开始 middle 中间 end 结尾
            Typeface=Typeface.DEFAULT_BOLD;--字体
            --textIsSelectable=true;--文本可复制
            --style="?android:attr/buttonBarButtonStyle";--点击特效
            gravity='center|left';--重力
            --左:left 右:right 中:center 顶:top 底:bottom
            layout_margin='5dp';--卡片边距
            layout_weight='1';--权重值
          };
          {
            ImageView;--图片控件
            layout_width='25dp';--图片宽度
            layout_height='25dp';--图片高度
            --src='';--图片路径
            id='page2'..编号..'arrow';--设置控件ID
            ColorFilter=颜色;--图片着色
            --ColorFilter=Color.BLUE;--设置图片着色
            scaleType='fitXY';--图片拉伸
            layout_gravity='center';--重力
            layout_margin='5dp';--控件外边距
          };
        };
        {
          FlowLayout;
          layout_width="fill";--布局宽度
          layout_height="fill";--布局高度
          MaxRows='4dp';
          MinChildSpacing='10dp';
          --自控力间距
          ChildSpacing='10dp';
          --行间距
          RowSpacing="10dp";
          id='page2'..编号..'flow';--设置控件ID
          layout_margin='10dp';--控件外边距
          layout_marginTop='0dp';--控件顶距
        };
      };
    };
    {
      TextView;--横向分割线
      layout_width='fill';--分割线宽度
      layout_height='2px';--分割线厚度
      layout_gravity='center';--高度居中
      backgroundColor=分割线色;--分割线颜色
      layout_marginTop='5dp';--控件顶距
      layout_marginBottom='5dp';--控件底距
    };
  }
  page2linear.addView(loadlayout(功能组布局))
  if(activity.getSharedData("page2"..编号.."展开"))then
    展开(编号)
   else
    折叠(编号)
  end
  _ENV["page2"..编号.."title"].onClick=function()
    if(activity.getSharedData("page2"..编号.."展开"))then
      折叠(编号)
      activity.setSharedData("page2"..编号.."展开",false)
     else
      展开(编号)
      activity.setSharedData("page2"..编号.."展开",true)
    end
  end
end

function 添加第二页功能(编号,标题,类型,点击)
  if(类型=="1")then--类型1：普通
    文字颜色=主文本色
    文字类型=Typeface.DEFAULT
  end
  if(类型=="2")then--类型2：加粗
    文字颜色=主文本色
    文字类型=Typeface.DEFAULT_BOLD
  end
  if(类型=="3")then--类型3：强调
    文字颜色=主题色
    文字类型=Typeface.DEFAULT_BOLD
  end
  功能布局={
    LinearLayout;--线性控件
    orientation='horizontal';--布局方向
    layout_width='wrap';--布局宽度
    layout_height='wrap';--布局高度
    gravity='center';--控件内容的重力方向
    --左:left 右:right 中:center 顶:top 底:bottom
    BackgroundDrawable=CircleButton(转0x(背景色),90);
    {
      TextView;--文本控件
      layout_width='fill';--控件宽度
      layout_height='fill';--控件高度
      text=标题;--显示文字
      textSize='15sp';--文字大小
      textColor=文字颜色;--文字颜色
      id='page2item';--设置控件ID
      --singleLine=true;--设置单行输入
      --ellipsize='end';--多余文字用省略号显示
      --start 开始 middle 中间 end 结尾
      Typeface=文字类型;--字体
      --textIsSelectable=true;--文本可复制
      --.style="?android:attr/buttonBarButtonStyle";--点击特效
      gravity='center';--重力
      --左:left 右:right 中:center 顶:top 底:bottom
      padding='7dp';--控件内边距
      layout_marginLeft='5dp';--控件左距
      layout_marginRight='5dp';--控件右距
      background=列表波纹(转0x(波纹色));
      onClick=点击;
      onLongClick=function()
        if not 获取收藏("收藏",标题) then
          local dialog=AlertDialog.Builder(this)
          .setTitle("收藏")
          .setMessage("要将"..标题.."添加到收藏中吗？")
          .setPositiveButton("确定",function()
            添加收藏("收藏",标题,string.dump(点击))
            弹出SnackBar("已将"..标题.."添加到收藏中")
            更新收藏()
          end)
          .setNegativeButton("取消",nil)
          .show()
          dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(转0x(主题色))
          dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(转0x(主题色))
         else
          弹出SnackBar("该功能已在收藏中")
        end
      end
    };
  }

  _ENV["page2"..编号.."flow"].addView(loadlayout(功能布局))
end

添加第二页功能组("a","日常功能","drawable/wb_sunny_black.png","#FFE84033")
添加第二页功能组("b","查询功能","drawable/search_black.png","#FF3F51B5")
添加第二页功能组("c","图片功能","drawable/image_black.png","#FF009788")
添加第二页功能组("d","文字功能","drawable/text_fields_black.png","#FF2196F3")
添加第二页功能组("e","计算功能","drawable/exposure_black.png","#FF9C28B1")
添加第二页功能组("f","影音功能","drawable/movie_black.png","#FF795547")
添加第二页功能组("g","设备功能","drawable/phone_android_black.png","#FF673BB7")
添加第二页功能组("h","其它功能","drawable/more_black.png","#FF607D8B")

import "list"
for i=1,#功能列表 do
  添加第二页功能(功能列表[i][1],功能列表[i][2],功能列表[i][3],功能列表[i][4])
end

