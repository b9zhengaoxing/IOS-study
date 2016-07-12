# UIView中的坐标转换
----

## Point
将像素point由point所在视图转换到目标视图view中，返回在**目标视图**view中的像素值

```
- (CGPoint)convertPoint:(CGPoint)point toView:(UIView *)view;
```

将像素point从view中转换到当前视图中，返回在**当前视图**中的像素值

```
- (CGPoint)convertPoint:(CGPoint)point fromView:(UIView *)view;
```

## Rect
将rect由rect所在视图转换到目标视图view中，返回在**目标视图**view中的rect

```
- (CGRect)convertRect:(CGRect)rect toView:(UIView *)view;
```
将rect从view中转换到当前视图中，返回在**当前视图**中的rect

```
- (CGRect)convertRect:(CGRect)rect fromView:(UIView *)view;- 
```


### 例：把UITableViewCell中的subview(btn)的frame转换到 controllerA中
```
// controllerA 中有一个UITableView, UITableView里有多行UITableVieCell，cell上放有一个button
// 在controllerA中实现:
CGRect rc = [cell convertRect:cell.btn.frame toView:self.view];
或
CGRect rc = [self.view convertRect:cell.btn.frame fromView:cell];
// 此rc为btn在controllerA中的rect

或当已知btn时：
CGRect rc = [btn.superview convertRect:btn.frame toView:self.view];
或
CGRect rc = [self.view convertRect:btn.frame fromView:btn.superview];
```



# 找到superView
TableView中，由Cell找到TableView可以通过superView来找
往往是坑

```
UIButton * view = _rightBtn;
// 循环找父视图，找到TableView为止
while (view != nil && ![view isKindOfClass:[QYTableView class]]) {
    view = [view superview];
}
```













