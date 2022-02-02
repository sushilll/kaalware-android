.class final Lokio/AsyncTimeout$Watchdog;
.super Ljava/lang/Thread;
.source "AsyncTimeout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokio/AsyncTimeout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Watchdog"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 302
    const-string v0, "Okio Watchdog"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 303
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lokio/AsyncTimeout$Watchdog;->setDaemon(Z)V

    .line 304
    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 310
    :goto_0
    :try_start_0
    const-class v0, Lokio/AsyncTimeout;

    monitor-enter v0
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_3} :catch_1f

    .line 311
    :try_start_3
    invoke-static {}, Lokio/AsyncTimeout;->awaitTimeout()Lokio/AsyncTimeout;

    move-result-object v1

    .line 314
    .local v1, "timedOut":Lokio/AsyncTimeout;
    if-nez v1, :cond_b

    monitor-exit v0

    goto :goto_0

    .line 318
    :cond_b
    invoke-static {}, Lokio/AsyncTimeout;->access$000()Lokio/AsyncTimeout;

    move-result-object v2

    if-ne v1, v2, :cond_17

    .line 319
    const/4 v2, 0x0

    invoke-static {v2}, Lokio/AsyncTimeout;->access$002(Lokio/AsyncTimeout;)Lokio/AsyncTimeout;

    .line 320
    monitor-exit v0

    return-void

    .line 322
    :cond_17
    monitor-exit v0
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_1c

    .line 325
    :try_start_18
    invoke-virtual {v1}, Lokio/AsyncTimeout;->timedOut()V
    :try_end_1b
    .catch Ljava/lang/InterruptedException; {:try_start_18 .. :try_end_1b} :catch_1f

    .end local v1    # "timedOut":Lokio/AsyncTimeout;
    goto :goto_20

    .line 322
    :catchall_1c
    move-exception v1

    :try_start_1d
    monitor-exit v0
    :try_end_1e
    .catchall {:try_start_1d .. :try_end_1e} :catchall_1c

    :try_start_1e
    throw v1
    :try_end_1f
    .catch Ljava/lang/InterruptedException; {:try_start_1e .. :try_end_1f} :catch_1f

    .line 326
    :catch_1f
    move-exception v0

    .line 327
    :goto_20
    goto :goto_0
.end method
