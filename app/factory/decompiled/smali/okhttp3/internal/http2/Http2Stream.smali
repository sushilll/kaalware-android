.class public final Lokhttp3/internal/http2/Http2Stream;
.super Ljava/lang/Object;
.source "Http2Stream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/internal/http2/Http2Stream$StreamTimeout;,
        Lokhttp3/internal/http2/Http2Stream$FramedDataSink;,
        Lokhttp3/internal/http2/Http2Stream$FramedDataSource;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field bytesLeftInWriteWindow:J

.field final connection:Lokhttp3/internal/http2/Http2Connection;

.field errorCode:Lokhttp3/internal/http2/ErrorCode;

.field final id:I

.field final readTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

.field private final requestHeaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lokhttp3/internal/http2/Header;",
            ">;"
        }
    .end annotation
.end field

.field private responseHeaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lokhttp3/internal/http2/Header;",
            ">;"
        }
    .end annotation
.end field

.field final sink:Lokhttp3/internal/http2/Http2Stream$FramedDataSink;

.field private final source:Lokhttp3/internal/http2/Http2Stream$FramedDataSource;

.field unacknowledgedBytesRead:J

.field final writeTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;


# direct methods
.method static constructor <clinit>()V
    .registers 0

    .line 32
    return-void
.end method

.method constructor <init>(ILokhttp3/internal/http2/Http2Connection;ZZLjava/util/List;)V
    .registers 9
    .param p1, "id"    # I
    .param p2, "connection"    # Lokhttp3/internal/http2/Http2Connection;
    .param p3, "outFinished"    # Z
    .param p4, "inFinished"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lokhttp3/internal/http2/Http2Connection;",
            "ZZ",
            "Ljava/util/List<",
            "Lokhttp3/internal/http2/Header;",
            ">;)V"
        }
    .end annotation

    .line 73
    .local p5, "requestHeaders":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/http2/Header;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lokhttp3/internal/http2/Http2Stream;->unacknowledgedBytesRead:J

    .line 62
    new-instance v0, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-direct {v0, p0}, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;-><init>(Lokhttp3/internal/http2/Http2Stream;)V

    iput-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->readTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    .line 63
    new-instance v0, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-direct {v0, p0}, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;-><init>(Lokhttp3/internal/http2/Http2Stream;)V

    iput-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->writeTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    .line 70
    const/4 v0, 0x0

    iput-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    .line 74
    if-eqz p2, :cond_51

    .line 75
    if-eqz p5, :cond_49

    .line 76
    iput p1, p0, Lokhttp3/internal/http2/Http2Stream;->id:I

    .line 77
    iput-object p2, p0, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    .line 78
    iget-object v0, p2, Lokhttp3/internal/http2/Http2Connection;->peerSettings:Lokhttp3/internal/http2/Settings;

    .line 79
    invoke-virtual {v0}, Lokhttp3/internal/http2/Settings;->getInitialWindowSize()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lokhttp3/internal/http2/Http2Stream;->bytesLeftInWriteWindow:J

    .line 80
    new-instance v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;

    iget-object v1, p2, Lokhttp3/internal/http2/Http2Connection;->okHttpSettings:Lokhttp3/internal/http2/Settings;

    .line 81
    invoke-virtual {v1}, Lokhttp3/internal/http2/Settings;->getInitialWindowSize()I

    move-result v1

    int-to-long v1, v1

    invoke-direct {v0, p0, v1, v2}, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;-><init>(Lokhttp3/internal/http2/Http2Stream;J)V

    iput-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->source:Lokhttp3/internal/http2/Http2Stream$FramedDataSource;

    .line 82
    new-instance v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;

    invoke-direct {v0, p0}, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;-><init>(Lokhttp3/internal/http2/Http2Stream;)V

    iput-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->sink:Lokhttp3/internal/http2/Http2Stream$FramedDataSink;

    .line 83
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->source:Lokhttp3/internal/http2/Http2Stream$FramedDataSource;

    iput-boolean p4, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->finished:Z

    .line 84
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->sink:Lokhttp3/internal/http2/Http2Stream$FramedDataSink;

    iput-boolean p3, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->finished:Z

    .line 85
    iput-object p5, p0, Lokhttp3/internal/http2/Http2Stream;->requestHeaders:Ljava/util/List;

    .line 86
    return-void

    .line 75
    :cond_49
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "requestHeaders == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_51
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "connection == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private closeInternal(Lokhttp3/internal/http2/ErrorCode;)Z
    .registers 4
    .param p1, "errorCode"    # Lokhttp3/internal/http2/ErrorCode;

    .line 235
    nop

    .line 236
    monitor-enter p0

    .line 237
    :try_start_2
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    const/4 v1, 0x0

    if-eqz v0, :cond_9

    .line 238
    monitor-exit p0

    return v1

    .line 240
    :cond_9
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->source:Lokhttp3/internal/http2/Http2Stream$FramedDataSource;

    iget-boolean v0, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->finished:Z

    if-eqz v0, :cond_17

    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->sink:Lokhttp3/internal/http2/Http2Stream$FramedDataSink;

    iget-boolean v0, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->finished:Z

    if-eqz v0, :cond_17

    .line 241
    monitor-exit p0

    return v1

    .line 243
    :cond_17
    iput-object p1, p0, Lokhttp3/internal/http2/Http2Stream;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    .line 244
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 245
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_2 .. :try_end_1d} :catchall_26

    .line 246
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget v1, p0, Lokhttp3/internal/http2/Http2Stream;->id:I

    invoke-virtual {v0, v1}, Lokhttp3/internal/http2/Http2Connection;->removeStream(I)Lokhttp3/internal/http2/Http2Stream;

    .line 247
    const/4 v0, 0x1

    return v0

    .line 245
    :catchall_26
    move-exception v0

    :try_start_27
    monitor-exit p0
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_26

    throw v0
.end method


# virtual methods
.method addBytesToWriteWindow(J)V
    .registers 6
    .param p1, "delta"    # J

    .line 551
    iget-wide v0, p0, Lokhttp3/internal/http2/Http2Stream;->bytesLeftInWriteWindow:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lokhttp3/internal/http2/Http2Stream;->bytesLeftInWriteWindow:J

    .line 552
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_e

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 553
    :cond_e
    return-void
.end method

.method cancelStreamIfNecessary()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 434
    nop

    .line 437
    monitor-enter p0

    .line 438
    :try_start_2
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->source:Lokhttp3/internal/http2/Http2Stream$FramedDataSource;

    iget-boolean v0, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->finished:Z

    if-nez v0, :cond_1c

    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->source:Lokhttp3/internal/http2/Http2Stream$FramedDataSource;

    iget-boolean v0, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->closed:Z

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->sink:Lokhttp3/internal/http2/Http2Stream$FramedDataSink;

    iget-boolean v0, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->finished:Z

    if-nez v0, :cond_1a

    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->sink:Lokhttp3/internal/http2/Http2Stream$FramedDataSink;

    iget-boolean v0, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->closed:Z

    if-eqz v0, :cond_1c

    :cond_1a
    const/4 v0, 0x1

    goto :goto_1d

    :cond_1c
    const/4 v0, 0x0

    .line 439
    .local v0, "cancel":Z
    :goto_1d
    invoke-virtual {p0}, Lokhttp3/internal/http2/Http2Stream;->isOpen()Z

    move-result v1

    .line 440
    .local v1, "open":Z
    monitor-exit p0
    :try_end_22
    .catchall {:try_start_2 .. :try_end_22} :catchall_34

    .line 441
    if-eqz v0, :cond_2a

    .line 446
    sget-object v2, Lokhttp3/internal/http2/ErrorCode;->CANCEL:Lokhttp3/internal/http2/ErrorCode;

    invoke-virtual {p0, v2}, Lokhttp3/internal/http2/Http2Stream;->close(Lokhttp3/internal/http2/ErrorCode;)V

    goto :goto_33

    .line 447
    :cond_2a
    if-nez v1, :cond_33

    .line 448
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget v3, p0, Lokhttp3/internal/http2/Http2Stream;->id:I

    invoke-virtual {v2, v3}, Lokhttp3/internal/http2/Http2Connection;->removeStream(I)Lokhttp3/internal/http2/Http2Stream;

    .line 450
    :cond_33
    :goto_33
    return-void

    .line 440
    .end local v0    # "cancel":Z
    .end local v1    # "open":Z
    :catchall_34
    move-exception v0

    :try_start_35
    monitor-exit p0
    :try_end_36
    .catchall {:try_start_35 .. :try_end_36} :catchall_34

    throw v0
.end method

.method checkOutNotClosed()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 556
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->sink:Lokhttp3/internal/http2/Http2Stream$FramedDataSink;

    iget-boolean v0, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->closed:Z

    if-nez v0, :cond_1f

    .line 558
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->sink:Lokhttp3/internal/http2/Http2Stream$FramedDataSink;

    iget-boolean v0, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->finished:Z

    if-nez v0, :cond_17

    .line 560
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    if-nez v0, :cond_11

    .line 563
    return-void

    .line 561
    :cond_11
    new-instance v1, Lokhttp3/internal/http2/StreamResetException;

    invoke-direct {v1, v0}, Lokhttp3/internal/http2/StreamResetException;-><init>(Lokhttp3/internal/http2/ErrorCode;)V

    throw v1

    .line 559
    :cond_17
    new-instance v0, Ljava/io/IOException;

    const-string v1, "stream finished"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 557
    :cond_1f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "stream closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close(Lokhttp3/internal/http2/ErrorCode;)V
    .registers 4
    .param p1, "rstStatusCode"    # Lokhttp3/internal/http2/ErrorCode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 216
    invoke-direct {p0, p1}, Lokhttp3/internal/http2/Http2Stream;->closeInternal(Lokhttp3/internal/http2/ErrorCode;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 217
    return-void

    .line 219
    :cond_7
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget v1, p0, Lokhttp3/internal/http2/Http2Stream;->id:I

    invoke-virtual {v0, v1, p1}, Lokhttp3/internal/http2/Http2Connection;->writeSynReset(ILokhttp3/internal/http2/ErrorCode;)V

    .line 220
    return-void
.end method

.method public closeLater(Lokhttp3/internal/http2/ErrorCode;)V
    .registers 4
    .param p1, "errorCode"    # Lokhttp3/internal/http2/ErrorCode;

    .line 227
    invoke-direct {p0, p1}, Lokhttp3/internal/http2/Http2Stream;->closeInternal(Lokhttp3/internal/http2/ErrorCode;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 228
    return-void

    .line 230
    :cond_7
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget v1, p0, Lokhttp3/internal/http2/Http2Stream;->id:I

    invoke-virtual {v0, v1, p1}, Lokhttp3/internal/http2/Http2Connection;->writeSynResetLater(ILokhttp3/internal/http2/ErrorCode;)V

    .line 231
    return-void
.end method

.method public getConnection()Lokhttp3/internal/http2/Http2Connection;
    .registers 2

    .line 122
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    return-object v0
.end method

.method public declared-synchronized getErrorCode()Lokhttp3/internal/http2/ErrorCode;
    .registers 2

    monitor-enter p0

    .line 151
    :try_start_1
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->errorCode:Lokhttp3/internal/http2/ErrorCode;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    .end local p0    # "this":Lokhttp3/internal/http2/Http2Stream;
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getId()I
    .registers 2

    .line 89
    iget v0, p0, Lokhttp3/internal/http2/Http2Stream;->id:I

    return v0
.end method

.method public getRequestHeaders()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lokhttp3/internal/http2/Header;",
            ">;"
        }
    .end annotation

    .line 126
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->requestHeaders:Ljava/util/List;

    return-object v0
.end method

.method public declared-synchronized getResponseHeaders()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lokhttp3/internal/http2/Header;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 134
    :try_start_1
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->readTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-virtual {v0}, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;->enter()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_31

    .line 136
    :goto_6
    :try_start_6
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->responseHeaders:Ljava/util/List;
    :try_end_8
    .catchall {:try_start_6 .. :try_end_8} :catchall_2a

    if-nez v0, :cond_14

    :try_start_a
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    if-nez v0, :cond_14

    .line 137
    invoke-virtual {p0}, Lokhttp3/internal/http2/Http2Stream;->waitForIo()V
    :try_end_11
    .catchall {:try_start_a .. :try_end_11} :catchall_12

    goto :goto_6

    .line 140
    :catchall_12
    move-exception v0

    goto :goto_2b

    :cond_14
    :try_start_14
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->readTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-virtual {v0}, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    .line 141
    nop

    .line 142
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->responseHeaders:Ljava/util/List;

    if-eqz v0, :cond_22

    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->responseHeaders:Ljava/util/List;
    :try_end_20
    .catchall {:try_start_14 .. :try_end_20} :catchall_31

    monitor-exit p0

    return-object v0

    .line 143
    .end local p0    # "this":Lokhttp3/internal/http2/Http2Stream;
    :cond_22
    :try_start_22
    new-instance v0, Lokhttp3/internal/http2/StreamResetException;

    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    invoke-direct {v0, v1}, Lokhttp3/internal/http2/StreamResetException;-><init>(Lokhttp3/internal/http2/ErrorCode;)V

    throw v0

    .line 140
    :catchall_2a
    move-exception v0

    :goto_2b
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream;->readTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-virtual {v1}, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    throw v0
    :try_end_31
    .catchall {:try_start_22 .. :try_end_31} :catchall_31

    .line 133
    :catchall_31
    move-exception v0

    monitor-exit p0

    goto :goto_35

    :goto_34
    throw v0

    :goto_35
    goto :goto_34
.end method

.method public getSink()Lokio/Sink;
    .registers 3

    .line 203
    monitor-enter p0

    .line 204
    :try_start_1
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->responseHeaders:Ljava/util/List;

    if-nez v0, :cond_14

    invoke-virtual {p0}, Lokhttp3/internal/http2/Http2Stream;->isLocallyInitiated()Z

    move-result v0

    if-eqz v0, :cond_c

    goto :goto_14

    .line 205
    :cond_c
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "reply before requesting the sink"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 207
    :cond_14
    :goto_14
    monitor-exit p0
    :try_end_15
    .catchall {:try_start_1 .. :try_end_15} :catchall_18

    .line 208
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->sink:Lokhttp3/internal/http2/Http2Stream$FramedDataSink;

    return-object v0

    .line 207
    :catchall_18
    move-exception v0

    :try_start_19
    monitor-exit p0
    :try_end_1a
    .catchall {:try_start_19 .. :try_end_1a} :catchall_18

    throw v0
.end method

.method public getSource()Lokio/Source;
    .registers 2

    .line 193
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->source:Lokhttp3/internal/http2/Http2Stream$FramedDataSource;

    return-object v0
.end method

.method public isLocallyInitiated()Z
    .registers 5

    .line 117
    iget v0, p0, Lokhttp3/internal/http2/Http2Stream;->id:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    .line 118
    .local v0, "streamIsClient":Z
    :goto_a
    iget-object v3, p0, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget-boolean v3, v3, Lokhttp3/internal/http2/Http2Connection;->client:Z

    if-ne v3, v0, :cond_11

    goto :goto_12

    :cond_11
    const/4 v1, 0x0

    :goto_12
    return v1
.end method

.method public declared-synchronized isOpen()Z
    .registers 3

    monitor-enter p0

    .line 104
    :try_start_1
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->errorCode:Lokhttp3/internal/http2/ErrorCode;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_29

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    .line 105
    monitor-exit p0

    return v1

    .line 107
    :cond_8
    :try_start_8
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->source:Lokhttp3/internal/http2/Http2Stream$FramedDataSource;

    iget-boolean v0, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->finished:Z

    if-nez v0, :cond_14

    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->source:Lokhttp3/internal/http2/Http2Stream$FramedDataSource;

    iget-boolean v0, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->closed:Z

    if-eqz v0, :cond_26

    .end local p0    # "this":Lokhttp3/internal/http2/Http2Stream;
    :cond_14
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->sink:Lokhttp3/internal/http2/Http2Stream$FramedDataSink;

    iget-boolean v0, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->finished:Z

    if-nez v0, :cond_20

    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->sink:Lokhttp3/internal/http2/Http2Stream$FramedDataSink;

    iget-boolean v0, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->closed:Z

    if-eqz v0, :cond_26

    :cond_20
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->responseHeaders:Ljava/util/List;
    :try_end_22
    .catchall {:try_start_8 .. :try_end_22} :catchall_29

    if-eqz v0, :cond_26

    .line 110
    monitor-exit p0

    return v1

    .line 112
    :cond_26
    const/4 v0, 0x1

    monitor-exit p0

    return v0

    .line 103
    :catchall_29
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public readTimeout()Lokio/Timeout;
    .registers 2

    .line 184
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->readTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    return-object v0
.end method

.method receiveData(Lokio/BufferedSource;I)V
    .registers 6
    .param p1, "in"    # Lokio/BufferedSource;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 271
    nop

    .line 272
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->source:Lokhttp3/internal/http2/Http2Stream$FramedDataSource;

    int-to-long v1, p2

    invoke-virtual {v0, p1, v1, v2}, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->receive(Lokio/BufferedSource;J)V

    .line 273
    return-void
.end method

.method receiveFin()V
    .registers 4

    .line 276
    nop

    .line 278
    monitor-enter p0

    .line 279
    :try_start_2
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->source:Lokhttp3/internal/http2/Http2Stream$FramedDataSource;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->finished:Z

    .line 280
    invoke-virtual {p0}, Lokhttp3/internal/http2/Http2Stream;->isOpen()Z

    move-result v0

    .line 281
    .local v0, "open":Z
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 282
    monitor-exit p0
    :try_end_f
    .catchall {:try_start_2 .. :try_end_f} :catchall_19

    .line 283
    if-nez v0, :cond_18

    .line 284
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget v2, p0, Lokhttp3/internal/http2/Http2Stream;->id:I

    invoke-virtual {v1, v2}, Lokhttp3/internal/http2/Http2Connection;->removeStream(I)Lokhttp3/internal/http2/Http2Stream;

    .line 286
    :cond_18
    return-void

    .line 282
    .end local v0    # "open":Z
    :catchall_19
    move-exception v0

    :try_start_1a
    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_1a .. :try_end_1b} :catchall_19

    throw v0
.end method

.method receiveHeaders(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lokhttp3/internal/http2/Header;",
            ">;)V"
        }
    .end annotation

    .line 251
    .local p1, "headers":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/http2/Header;>;"
    nop

    .line 252
    const/4 v0, 0x1

    .line 253
    .local v0, "open":Z
    monitor-enter p0

    .line 254
    :try_start_3
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream;->responseHeaders:Ljava/util/List;

    if-nez v1, :cond_12

    .line 255
    iput-object p1, p0, Lokhttp3/internal/http2/Http2Stream;->responseHeaders:Ljava/util/List;

    .line 256
    invoke-virtual {p0}, Lokhttp3/internal/http2/Http2Stream;->isOpen()Z

    move-result v1

    move v0, v1

    .line 257
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    goto :goto_21

    .line 259
    :cond_12
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 260
    .local v1, "newHeaders":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/http2/Header;>;"
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Stream;->responseHeaders:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 261
    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 262
    iput-object v1, p0, Lokhttp3/internal/http2/Http2Stream;->responseHeaders:Ljava/util/List;

    .line 264
    .end local v1    # "newHeaders":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/http2/Header;>;"
    :goto_21
    monitor-exit p0
    :try_end_22
    .catchall {:try_start_3 .. :try_end_22} :catchall_2c

    .line 265
    if-nez v0, :cond_2b

    .line 266
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget v2, p0, Lokhttp3/internal/http2/Http2Stream;->id:I

    invoke-virtual {v1, v2}, Lokhttp3/internal/http2/Http2Connection;->removeStream(I)Lokhttp3/internal/http2/Http2Stream;

    .line 268
    :cond_2b
    return-void

    .line 264
    :catchall_2c
    move-exception v1

    :try_start_2d
    monitor-exit p0
    :try_end_2e
    .catchall {:try_start_2d .. :try_end_2e} :catchall_2c

    throw v1
.end method

.method declared-synchronized receiveRstStream(Lokhttp3/internal/http2/ErrorCode;)V
    .registers 3
    .param p1, "errorCode"    # Lokhttp3/internal/http2/ErrorCode;

    monitor-enter p0

    .line 289
    :try_start_1
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    if-nez v0, :cond_a

    .line 290
    iput-object p1, p0, Lokhttp3/internal/http2/Http2Stream;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    .line 291
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 293
    .end local p0    # "this":Lokhttp3/internal/http2/Http2Stream;
    :cond_a
    monitor-exit p0

    return-void

    .line 288
    .end local p1    # "errorCode":Lokhttp3/internal/http2/ErrorCode;
    :catchall_c
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public reply(Ljava/util/List;Z)V
    .registers 6
    .param p2, "out"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lokhttp3/internal/http2/Header;",
            ">;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 161
    .local p1, "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/http2/Header;>;"
    nop

    .line 162
    const/4 v0, 0x0

    .line 163
    .local v0, "outFinished":Z
    monitor-enter p0

    .line 164
    if-eqz p1, :cond_2d

    .line 167
    :try_start_5
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream;->responseHeaders:Ljava/util/List;

    if-nez v1, :cond_23

    .line 170
    iput-object p1, p0, Lokhttp3/internal/http2/Http2Stream;->responseHeaders:Ljava/util/List;

    .line 171
    if-nez p2, :cond_13

    .line 172
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream;->sink:Lokhttp3/internal/http2/Http2Stream$FramedDataSink;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->finished:Z

    .line 173
    const/4 v0, 0x1

    .line 175
    :cond_13
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_5 .. :try_end_14} :catchall_2b

    .line 176
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget v2, p0, Lokhttp3/internal/http2/Http2Stream;->id:I

    invoke-virtual {v1, v2, v0, p1}, Lokhttp3/internal/http2/Http2Connection;->writeSynReply(IZLjava/util/List;)V

    .line 178
    if-eqz v0, :cond_22

    .line 179
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v1}, Lokhttp3/internal/http2/Http2Connection;->flush()V

    .line 181
    :cond_22
    return-void

    .line 168
    :cond_23
    :try_start_23
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "reply already sent"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v0    # "outFinished":Z
    .end local p1    # "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/http2/Header;>;"
    .end local p2    # "out":Z
    throw v1

    .line 175
    .restart local v0    # "outFinished":Z
    .restart local p1    # "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/http2/Header;>;"
    .restart local p2    # "out":Z
    :catchall_2b
    move-exception v1

    goto :goto_35

    .line 165
    :cond_2d
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "responseHeaders == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .end local v0    # "outFinished":Z
    .end local p1    # "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/http2/Header;>;"
    .end local p2    # "out":Z
    throw v1

    .line 175
    .restart local v0    # "outFinished":Z
    .restart local p1    # "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/http2/Header;>;"
    .restart local p2    # "out":Z
    :goto_35
    monitor-exit p0
    :try_end_36
    .catchall {:try_start_23 .. :try_end_36} :catchall_2b

    throw v1
.end method

.method waitForIo()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InterruptedIOException;
        }
    .end annotation

    .line 571
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_3} :catch_5

    .line 574
    nop

    .line 575
    return-void

    .line 572
    :catch_5
    move-exception v0

    .line 573
    .local v0, "e":Ljava/lang/InterruptedException;
    new-instance v1, Ljava/io/InterruptedIOException;

    invoke-direct {v1}, Ljava/io/InterruptedIOException;-><init>()V

    throw v1
.end method

.method public writeTimeout()Lokio/Timeout;
    .registers 2

    .line 188
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream;->writeTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    return-object v0
.end method
