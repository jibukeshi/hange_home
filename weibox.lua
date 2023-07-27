import "LuaGo"--中文函数库
import "com.中文辅助类.对话框"
import "com.中文辅助类.泡沫对话框"

import "android.graphics.Color"
import "com.google.android.material.card.MaterialCardView"
import "com.google.android.material.button.MaterialButton"
import "com.google.android.material.textfield.TextInputLayout"
import "com.google.android.material.textfield.TextInputEditText"


activity.setTheme(android.R.style.Theme_Material_Light_NoActionBar)--设置md主题
--activity.ActionBar.hide()--隐藏顶栏
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
activity.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)



function 列表波纹(color)
  import "android.content.res.ColorStateList"
  local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
  local typedArray =activity.obtainStyledAttributes(attrsArray)
  local ripple=typedArray.getResourceId(0,0)
  local Pretend=activity.Resources.getDrawable(ripple)
  Pretend.setColor(ColorStateList(int[0].class{int{}},int{color}))
  return Pretend
end

function 弹出SnackBar(内容,按钮,事件)
  import "android.view.View"
  import "com.google.android.material.snackbar.Snackbar"
  local anchor=activity.findViewById(android.R.id.content)
  local mSnackbar=Snackbar.make(anchor,内容,Snackbar.LENGTH_LONG)
  if(按钮~=nil)then
    mSnackbar.setAction(按钮,View.OnClickListener{
      onClick=事件
    })
  end
  mSnackbar.show()
end

function 转0x(input)
  local result
  if(#input==7)then
    result=tonumber("0xFF"..input:match("#(.+)"))
   elseif(#input==9)then
    result=tonumber("0x"..input:match("#(.+)"))
  end
  return result
end

function 加载图片(view,path)
  import "com.bumptech.glide.Glide"
  if(path)then
    if not(path:find("^/")) and not(path:find("^.+://")) then
      path=activity.getLuaDir().."/"..path
    end
    Glide.with(activity).load(path).into(view)
  end
end

function CircleButton(InsideColor,radiu)
  import "android.graphics.drawable.GradientDrawable"
  drawable=GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(InsideColor)
  drawable.setCornerRadii({radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu});
  return drawable
end

--初始化设置
if(activity.getSharedData("启动页")==nil)then
  activity.setSharedData("启动页",1)
end
if(activity.getSharedData("深色模式")==nil)then
  activity.setSharedData("深色模式",0)
end
if(activity.getSharedData("外观风格")==nil)then
  activity.setSharedData("外观风格",0)
end
if(activity.getSharedData("主题")==nil)then
  activity.setSharedData("主题","默认蓝")
end
if(activity.getSharedData("主题色")==nil)then
  activity.setSharedData("主题色","#FF0C84FF")
end
if(activity.getSharedData("改图标")==nil)then
  activity.setSharedData("改图标",false)
end
if(activity.getSharedData("改名称")==nil)then
  activity.setSharedData("改名称",false)
end

if(activity.getSharedData("主题")=="默认蓝" and activity.getSharedData("主题色")=="#FF0C84FF")then
  activity.setSharedData("主题色","#FF5187F4")
end

--颜色
主题配置=activity.getSharedData("主题")
深色配置=activity.getSharedData("深色模式")
主题色=activity.getSharedData("主题色")
if(深色配置==1)then
  卡片色="#FFFFFFFF"
  背景色="#FFF6F6F6"
  主文本色="#FF000000"
  辅文本色="#FF7D7D7D"
  分割线色="#FFE0E0E0"
  波纹色="#20000000"
end
if(深色配置==2)then
  卡片色="#FF202020"
  背景色="#FF000000"
  主文本色="#FFFFFFFF"
  辅文本色="#FF7D7D7D"
  分割线色="#FF303030"
  波纹色="#20FFFFFF"
end
if(深色配置==0)then
  if(activity.getSystemService(Context.UI_MODE_SERVICE).getNightMode()==2)then
    卡片色="#FF202020"
    背景色="#FF000000"
    主文本色="#FFFFFFFF"
    辅文本色="#FF7D7D7D"
    分割线色="#FF303030"
    波纹色="#20FFFFFF"
   else
    卡片色="#FFFFFFFF"
    背景色="#FFF6F6F6"
    主文本色="#FF000000"
    辅文本色="#FF7D7D7D"
    分割线色="#FFE0E0E0"
    波纹色="#20000000"
  end
end
--函鸽专用切换外观风格的顶栏色
if(activity.getSharedData("外观风格")==0)then
  顶栏背景色=卡片色
  顶栏主文本色=主文本色
  顶栏辅文本色=辅文本色
end
if(activity.getSharedData("外观风格")==1)then
  顶栏背景色=主题色
  顶栏主文本色="#FFFFFFFF"
  顶栏辅文本色="#BFFFFFFF"
end

--旧版一个函鸽兼容
if(activity.getSharedData("外观风格")==1 and activity.getSharedData("改图标"))then
  应用图标="icon2.png"
 else
  应用图标="icon.png"
end
if(activity.getSharedData("外观风格")==1 and activity.getSharedData("改名称"))then
  应用名称="一个函鸽"
  应用标语="一个永久免费无广告的多功能工具箱"
 else
  应用名称="函鸽"
  应用标语="免费无广，简洁好用"
end
activity.setTitle(应用名称)

--收藏
function 获取所有收藏(数据库)
  local data={}
  for d in each(activity.getApplicationContext().getSharedPreferences(数据库,0).getAll().entrySet()) do
    data[d.getKey()]=d.getValue()
  end
  return data
end
function 获取收藏(数据库,名称)
  local data=activity.getApplicationContext().getSharedPreferences(数据库,0).getString(名称,nil)
  return data
end
function 添加收藏(数据库,名称,内容)
  activity.getApplicationContext().getSharedPreferences(数据库,0).edit().putString(名称,内容).apply()
  return true
end
function 删除收藏(数据库,名称)
  activity.getApplicationContext().getSharedPreferences(数据库,0).edit().remove(名称).apply()
  return true
end
function 收藏标题(data)
  local keys={}
  for k,v in pairs(data) do
    keys[#keys+1]=k
  end
  return keys
end
function 收藏内容(data)
  local values={}
  for k,v in pairs(data) do
    values[#values+1]=v
  end
  return values
end
function 收藏适配器数据(data)
  local adpd={}
  for d in pairs(data) do
    table.insert(adpd,{
      title=tostring(data[d]),
      linear={background=列表波纹(0x20000000)},
    })
  end
  return adpd
end
