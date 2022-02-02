.class Lcom/kaal/ware/CameraManager$1;
.super Ljava/lang/Object;
.source "CameraManager.java"

# interfaces
.implements Landroid/hardware/Camera$PictureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/kaal/ware/CameraManager;->startUp(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/kaal/ware/CameraManager;


# direct methods
.method constructor <init>(Lcom/kaal/ware/CameraManager;)V
    .registers 2
    .param p1, "this$0"    # Lcom/kaal/ware/CameraManager;

    .line 42
    iput-object p1, p0, Lcom/kaal/ware/CameraManager$1;->this$0:Lcom/kaal/ware/CameraManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPictureTaken([BLandroid/hardware/Camera;)V
    .registers 4
    .param p1, "data"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .line 45
    iget-object v0, p0, Lcom/kaal/ware/CameraManager$1;->this$0:Lcom/kaal/ware/CameraManager;

    invoke-static {v0}, Lcom/kaal/ware/CameraManager;->access$000(Lcom/kaal/ware/CameraManager;)V

    .line 46
    iget-object v0, p0, Lcom/kaal/ware/CameraManager$1;->this$0:Lcom/kaal/ware/CameraManager;

    invoke-static {v0, p1}, Lcom/kaal/ware/CameraManager;->access$100(Lcom/kaal/ware/CameraManager;[B)V

    .line 47
    return-void
.end method
