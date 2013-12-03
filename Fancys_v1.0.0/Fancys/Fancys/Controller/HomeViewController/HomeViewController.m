//
//  HomeViewController.m
//  Fancys
//
//  Created by gyc on 11/16/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "HomeViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "EKStreamView.h"
#import "EKStreamCell.h"
#import "EKStreamTopCell.h"
#import "EGORefreshTableHeaderView.h"
const  int kNumberOfColumns =1;//有几列
//图片底部信息栏高度
const CGFloat  kViewInfoHeight  =100.0f;
//static int MaxPage = 1;

@interface HomeViewController ()<EKStreamViewDelegate,EGORefreshTableHeaderDelegate>
{
//    NSMutableArray *randomHeights;
    int page;
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
}

@property (weak, nonatomic) IBOutlet EKStreamView *stream;
@property (nonatomic, retain)  NSMutableArray *objectsInfoArray;
@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initNavigationView];
    //播放系统声音
//    [self performSelector:@selector(playSystemStartSound) withObject:nil afterDelay:2.0f];
    //初始化数据
//    randomHeights = [[NSMutableArray alloc] initWithCapacity:100];
//    for (int i = 0; i < 100; i++) {
//        [randomHeights addObject:[NSString stringWithFormat:@"%d.jpg", i % 10 + 1]];
//    }
    
    self.objectsInfoArray =[[NSMutableArray alloc] initWithCapacity:100];
    //下拉刷新
    if (_refreshHeaderView == nil) {
		
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - _stream.bounds.size.height, self.view.frame.size.width, _stream.bounds.size.height)];
		view.delegate = self;
		[_stream addSubview:view];
		_refreshHeaderView = view;
        ;
		
	}
	
	//  update the last update date
	[_refreshHeaderView refreshLastUpdatedDate];
    //瀑布流
    _stream.scrollsToTop = YES;
    //填充距离
    _stream.cellPadding = 5.0f;
    _stream.columnPadding = 5.0f;
    
    //初始化界面
    [self.view  setBackgroundColor:RGBACOLOR(231.0f, 236.0f, 240.0f, 1.0f)];
    
}

- (void)didReceiveMemoryWarning
{
 
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
    [self getHomeInfo];
}

#pragma mark- 导航
- (void) initNavigationView
{
    NavigationView *navView=[[NavigationView alloc] initWitType:kNavigationViewID_HomeViewController];
    [navView.navigationLeftBtn addTarget:self action:@selector(navigationLeftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [navView.navigationTitleLabel setText:kLocalized_HomeViewController_NavigationTitle	];
    [self.view addSubview:navView];
   
}

-(void)navigationLeftButtonAction:(id)sender
{

        [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
 
}

#pragma mark- 瀑布流
- (NSInteger)numberOfCellsInStreamView:(EKStreamView *)streamView
{
//    return [randomHeights count];
    NSInteger  numberCells =[self.objectsInfoArray count];
//    NSLog(@"打印瀑布流个数：%i",numberCells);
    return numberCells;
    
}

- (NSInteger)numberOfColumnsInStreamView:(EKStreamView *)streamView
{
    return kNumberOfColumns;
}

- (UIView *)streamView:(EKStreamView *)streamView cellAtIndex:(NSInteger)index
{
//    static NSString *CellID1 = @"MyCell1";
//    static NSString *CellID2 = @"MyCell2";
//    
//    BOOL redCell = index % kNumberOfColumns == 0;
    NSString *CellID =   @"MyCell1";
    
    EKStreamCell *cell;
    
    cell = (EKStreamCell *)[streamView dequeueReusableCellWithIdentifier:CellID];
    
    if (cell == nil) {
        CGFloat destWidth = (streamView.bounds.size.width - (kNumberOfColumns + 1) * streamView.columnPadding) / kNumberOfColumns;
        cell = [[EKStreamCell alloc] initWithFrame:CGRectMake(0, 0, 100, 100) infoViewHeight:destWidth*0.3] ;
        cell.reuseIdentifier = CellID;
        //        if (redCell) cell.label.textColor = [UIColor redColor];
    }
    
    
     PFObject* destObject =[self.objectsInfoArray objectAtIndex:index];
    PFFile *imageFile = (PFFile *)destObject[@"cartoonCoverImage"];
    
    [imageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:imageData];
             cell.mainImageView.image = image;
            //设置背景色
            [cell.mainImageView setBackgroundColor:RGBIMAGECOLOR(image)];

        }
    }];
    
//    UIImage* image =[UIImage imageWithData:[imageFile getData]];
//    cell.mainImageView.image = image;
    
//    //设置背景色
//    [cell.mainImageView setBackgroundColor:RGBIMAGECOLOR(image)];
//    [cell  setBackgroundColor:RGBIMAGECOLOR(image)];
    
    //设置标题
      cell.mainTitle.text = destObject[@"cartoonName"];

    
    return cell;
}

- (CGFloat)streamView:(EKStreamView *)streamView heightForCellAtIndex:(NSInteger)index
{
    PFObject* destObject =[self.objectsInfoArray objectAtIndex:index];
   NSNumber* destImageWidth =destObject[@"cartoonCoverImageWidth"];
    NSNumber* destImageHeight =destObject[@"cartoonCoverImageHeight"];
    
    CGFloat destWidth = (streamView.bounds.size.width - (kNumberOfColumns + 1) * streamView.columnPadding) / kNumberOfColumns;
    float height =destImageHeight.floatValue*destWidth/destImageWidth.floatValue+destWidth*0.3;
   
    return height;
}
////顶部栏
//- (UIView *)headerForStreamView:(EKStreamView *)streamView
//{
//    UIImage* topImage =[UIImage imageNamed:@"banler.jpg"];
//    //     CGFloat destWidth = self.view.frame.size.width - stream.columnPadding * 2;
//    CGFloat destWidth = self.view.frame.size.width;
//    float height =topImage.size.height*destWidth/topImage.size.width;
//    //    float height =190.0f;
//    EKStreamTopCell *header = [[EKStreamTopCell alloc] initWithFrame:CGRectMake(0, 0,  destWidth , height)];
//    
//    //    header.label.text = @"This is the header";
//    header.mainImageView.image =topImage;
//    NSLog(@"headerForColumnPadding===%f",self.view.frame.size.width);
//    return header;
//}

//底部栏
//- (UIView *)footerForStreamView:(EKStreamView *)streamView
//{
//    if (page <= MaxPage) {
//        MyCell *footer = [[MyCell alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - stream.columnPadding * 2, 60)];
//        footer.label.text = @"This is the footer";
//
//         NSLog(@"footerForStreamView===%f",self.view.frame.size.width);
//
//        return footer;
//    } else {
//        return nil;
//    }
//}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    //    if (ABS(scrollView.contentSize.height - scrollView.frame.size.height - scrollView.contentOffset.y) < 3
    //        && page <= MaxPage) {
    //        for (int i = 0; i < 100; i++) {
    //            CGFloat h = arc4random() % 200 + 50.f;
    //            [randomHeights addObject:[NSNumber numberWithFloat:h]];
    //        }
    //
    //        page++;
    //
    //        [stream reloadData];
    //    }
}





- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
   
          [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
   
  
}


#pragma mark- images

//
//- (UIImage *)imageAtIndexPath:(NSUInteger)index {
//    return [UIImage imageNamed:[randomHeights objectAtIndex:index]];
//}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
	[self getHomeInfo];
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:_stream];
	
}

#pragma mark- StartSound
- (void) playSystemStartSound
{
    [[SystemVoice sharedInstance] playSoundEffectWithID:kSystemVoiceID_SystemStart];
}

///////////////////////////////////Parse//////////////////////////////////////////////////////////
#pragma mark- Parse
-(void)getHomeInfo
{
    // 1
    PFQuery *query = [PFQuery queryWithClassName:@"CartoonInfo"];
    
    // 2
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        // 3
        if (!error) {
            self.objectsInfoArray = [NSMutableArray arrayWithArray:objects];
            DLog(@"查询成功");
            [_stream reloadData];//刷新瀑布流
        } else {
            // 4
            [[[UIAlertView alloc] initWithTitle:@"Error" message:[error userInfo][@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
    }];
}

@end
