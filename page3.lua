page3Layout=
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
    id='page3linear';--设置控件ID
    layoutTransition=LayoutTransition()
    .enableTransitionType(LayoutTransition.CHANGING)
    .setDuration(LayoutTransition.CHANGE_APPEARING,300)
    .setDuration(LayoutTransition.CHANGE_DISAPPEARING,300),
  };
}

page3.addView(loadlayout(page3Layout))


function 添加第三页功能组(编号,名称,图标,颜色)
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
      id='page3'..编号;--设置控件ID
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
          id='page3'..编号..'title';--设置控件ID
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
          id='page3'..编号..'flow';--设置控件ID
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
  page3linear.addView(loadlayout(功能组布局))
end

function 添加第三页功能(编号,标题,类型,点击)
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
      id='page3item';--设置控件ID
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
    };
  }
  _ENV["page3"..编号.."flow"].addView(loadlayout(功能布局))
end

添加第三页功能组("a","推荐功能","drawable/thumb_up_black.png","#FFE84033")
添加第三页功能组("b","近期更新","drawable/cloud_upload_black.png","#FF3F51B5")
添加第三页功能组("c","更多选项","drawable/explore_black.png","#FF009788")

import "list"
for i=1,#发现列表 do
  添加第三页功能(发现列表[i][1],发现列表[i][2],发现列表[i][3],发现列表[i][4])
end

