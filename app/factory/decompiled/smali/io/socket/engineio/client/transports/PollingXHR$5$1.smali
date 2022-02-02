.class Lio/socket/engineio/client/transports/PollingXHR$5$1;
.super Ljava/lang/Object;
.source "PollingXHR.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/transports/PollingXHR$5;->call([Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/socket/engineio/client/transports/PollingXHR$5;

.field final synthetic val$args:[Ljava/lang/Object;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/transports/PollingXHR$5;[Ljava/lang/Object;)V
    .registers 3
    .param p1, "this$1"    # Lio/socket/engineio/client/transports/PollingXHR$5;

    .line 104
    iput-object p1, p0, Lio/socket/engineio/client/transports/PollingXHR$5$1;->this$1:Lio/socket/engineio/client/transports/PollingXHR$5;

    iput-object p2, p0, Lio/socket/engineio/client/transports/PollingXHR$5$1;->val$args:[Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 107
    iget-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$5$1;->val$args:[Ljava/lang/Object;

    array-length v1, v0

    if-lez v1, :cond_9

    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    .line 108
    .local v0, "arg":Ljava/lang/Object;
    :goto_a
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_19

    .line 109
    iget-object v1, p0, Lio/socket/engineio/client/transports/PollingXHR$5$1;->this$1:Lio/socket/engineio/client/transports/PollingXHR$5;

    iget-object v1, v1, Lio/socket/engineio/client/transports/PollingXHR$5;->val$self:Lio/socket/engineio/client/transports/PollingXHR;

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Lio/socket/engineio/client/transports/PollingXHR;->onData(Ljava/lang/String;)V

    goto :goto_29

    .line 110
    :cond_19
    instance-of v1, v0, [B

    if-eqz v1, :cond_29

    .line 111
    iget-object v1, p0, Lio/socket/engineio/client/transports/PollingXHR$5$1;->this$1:Lio/socket/engineio/client/transports/PollingXHR$5;

    iget-object v1, v1, Lio/socket/engineio/client/transports/PollingXHR$5;->val$self:Lio/socket/engineio/client/transports/PollingXHR;

    move-object v2, v0

    check-cast v2, [B

    check-cast v2, [B

    invoke-virtual {v1, v2}, Lio/socket/engineio/client/transports/PollingXHR;->onData([B)V

    .line 113
    :cond_29
    :goto_29
    return-void
.end method
