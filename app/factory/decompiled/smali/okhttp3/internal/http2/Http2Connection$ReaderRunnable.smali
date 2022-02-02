.class Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;
.super Lokhttp3/internal/NamedRunnable;
.source "Http2Connection.java"

# interfaces
.implements Lokhttp3/internal/http2/Http2Reader$Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/internal/http2/Http2Connection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ReaderRunnable"
.end annotation


# instance fields
.field final reader:Lokhttp3/internal/http2/Http2Reader;

.field final synthetic this$0:Lokhttp3/internal/http2/Http2Connection;


# direct methods
.method constructor <init>(Lokhttp3/internal/http2/Http2Connection;Lokhttp3/internal/http2/Http2Reader;)V
    .registers 6
    .param p1, "this$0"    # Lokhttp3/internal/http2/Http2Connection;
    .param p2, "reader"    # Lokhttp3/internal/http2/Http2Reader;

    .line 556
    iput-object p1, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    .line 557
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iget-object v1, p1, Lokhttp3/internal/http2/Http2Connection;->hostname:Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "OkHttp %s"

    invoke-direct {p0, v1, v0}, Lokhttp3/internal/NamedRunnable;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 558
    iput-object p2, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->reader:Lokhttp3/internal/http2/Http2Reader;

    .line 559
    return-void
.end method

.method private applyAndAckSettings(Lokhttp3/internal/http2/Settings;)V
    .registers 7
    .param p1, "peerSettings"    # Lokhttp3/internal/http2/Settings;

    .line 695
    sget-object v0, Lokhttp3/internal/http2/Http2Connection;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable$3;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-object v3, v3, Lokhttp3/internal/http2/Http2Connection;->hostname:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "OkHttp %s ACK Settings"

    invoke-direct {v1, p0, v3, v2, p1}, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable$3;-><init>(Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;Ljava/lang/String;[Ljava/lang/Object;Lokhttp3/internal/http2/Settings;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 703
    return-void
.end method


# virtual methods
.method public ackSettings()V
    .registers 1

    .line 707
    return-void
.end method

.method public alternateService(ILjava/lang/String;Lokio/ByteString;Ljava/lang/String;IJ)V
    .registers 8
    .param p1, "streamId"    # I
    .param p2, "origin"    # Ljava/lang/String;
    .param p3, "protocol"    # Lokio/ByteString;
    .param p4, "host"    # Ljava/lang/String;
    .param p5, "port"    # I
    .param p6, "maxAge"    # J

    .line 770
    return-void
.end method

.method public data(ZILokio/BufferedSource;I)V
    .registers 8
    .param p1, "inFinished"    # Z
    .param p2, "streamId"    # I
    .param p3, "source"    # Lokio/BufferedSource;
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 586
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0, p2}, Lokhttp3/internal/http2/Http2Connection;->pushedStream(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 587
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0, p2, p3, p4, p1}, Lokhttp3/internal/http2/Http2Connection;->pushDataLater(ILokio/BufferedSource;IZ)V

    .line 588
    return-void

    .line 590
    :cond_e
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0, p2}, Lokhttp3/internal/http2/Http2Connection;->getStream(I)Lokhttp3/internal/http2/Http2Stream;

    move-result-object v0

    .line 591
    .local v0, "dataStream":Lokhttp3/internal/http2/Http2Stream;
    if-nez v0, :cond_22

    .line 592
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    sget-object v2, Lokhttp3/internal/http2/ErrorCode;->PROTOCOL_ERROR:Lokhttp3/internal/http2/ErrorCode;

    invoke-virtual {v1, p2, v2}, Lokhttp3/internal/http2/Http2Connection;->writeSynResetLater(ILokhttp3/internal/http2/ErrorCode;)V

    .line 593
    int-to-long v1, p4

    invoke-interface {p3, v1, v2}, Lokio/BufferedSource;->skip(J)V

    .line 594
    return-void

    .line 596
    :cond_22
    invoke-virtual {v0, p3, p4}, Lokhttp3/internal/http2/Http2Stream;->receiveData(Lokio/BufferedSource;I)V

    .line 597
    if-eqz p1, :cond_2a

    .line 598
    invoke-virtual {v0}, Lokhttp3/internal/http2/Http2Stream;->receiveFin()V

    .line 600
    :cond_2a
    return-void
.end method

.method protected execute()V
    .registers 5

    .line 562
    sget-object v0, Lokhttp3/internal/http2/ErrorCode;->INTERNAL_ERROR:Lokhttp3/internal/http2/ErrorCode;

    .line 563
    .local v0, "connectionErrorCode":Lokhttp3/internal/http2/ErrorCode;
    sget-object v1, Lokhttp3/internal/http2/ErrorCode;->INTERNAL_ERROR:Lokhttp3/internal/http2/ErrorCode;

    .line 565
    .local v1, "streamErrorCode":Lokhttp3/internal/http2/ErrorCode;
    :try_start_4
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-boolean v2, v2, Lokhttp3/internal/http2/Http2Connection;->client:Z

    if-nez v2, :cond_f

    .line 566
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->reader:Lokhttp3/internal/http2/Http2Reader;

    invoke-virtual {v2}, Lokhttp3/internal/http2/Http2Reader;->readConnectionPreface()V

    .line 568
    :cond_f
    :goto_f
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->reader:Lokhttp3/internal/http2/Http2Reader;

    invoke-virtual {v2, p0}, Lokhttp3/internal/http2/Http2Reader;->nextFrame(Lokhttp3/internal/http2/Http2Reader$Handler;)Z

    move-result v2

    if-eqz v2, :cond_18

    goto :goto_f

    .line 570
    :cond_18
    sget-object v2, Lokhttp3/internal/http2/ErrorCode;->NO_ERROR:Lokhttp3/internal/http2/ErrorCode;

    move-object v0, v2

    .line 571
    sget-object v2, Lokhttp3/internal/http2/ErrorCode;->CANCEL:Lokhttp3/internal/http2/ErrorCode;
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_1d} :catch_28
    .catchall {:try_start_4 .. :try_end_1d} :catchall_26

    move-object v1, v2

    .line 577
    :try_start_1e
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v2, v0, v1}, Lokhttp3/internal/http2/Http2Connection;->close(Lokhttp3/internal/http2/ErrorCode;Lokhttp3/internal/http2/ErrorCode;)V
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_23} :catch_24

    goto :goto_34

    .line 578
    :catch_24
    move-exception v2

    goto :goto_36

    .line 576
    :catchall_26
    move-exception v2

    goto :goto_3d

    .line 572
    :catch_28
    move-exception v2

    .line 573
    .local v2, "e":Ljava/io/IOException;
    :try_start_29
    sget-object v3, Lokhttp3/internal/http2/ErrorCode;->PROTOCOL_ERROR:Lokhttp3/internal/http2/ErrorCode;

    move-object v0, v3

    .line 574
    sget-object v3, Lokhttp3/internal/http2/ErrorCode;->PROTOCOL_ERROR:Lokhttp3/internal/http2/ErrorCode;
    :try_end_2e
    .catchall {:try_start_29 .. :try_end_2e} :catchall_26

    move-object v1, v3

    .line 577
    .end local v2    # "e":Ljava/io/IOException;
    :try_start_2f
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v2, v0, v1}, Lokhttp3/internal/http2/Http2Connection;->close(Lokhttp3/internal/http2/ErrorCode;Lokhttp3/internal/http2/ErrorCode;)V
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_34} :catch_35

    .line 579
    :goto_34
    goto :goto_36

    .line 578
    :catch_35
    move-exception v2

    .line 580
    :goto_36
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->reader:Lokhttp3/internal/http2/Http2Reader;

    invoke-static {v2}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 581
    nop

    .line 582
    return-void

    .line 577
    :goto_3d
    :try_start_3d
    iget-object v3, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v3, v0, v1}, Lokhttp3/internal/http2/Http2Connection;->close(Lokhttp3/internal/http2/ErrorCode;Lokhttp3/internal/http2/ErrorCode;)V
    :try_end_42
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_42} :catch_43

    .line 579
    goto :goto_44

    .line 578
    :catch_43
    move-exception v3

    .line 580
    :goto_44
    iget-object v3, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->reader:Lokhttp3/internal/http2/Http2Reader;

    invoke-static {v3}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_4b

    :goto_4a
    throw v2

    :goto_4b
    goto :goto_4a
.end method

.method public goAway(ILokhttp3/internal/http2/ErrorCode;Lokio/ByteString;)V
    .registers 10
    .param p1, "lastGoodStreamId"    # I
    .param p2, "errorCode"    # Lokhttp3/internal/http2/ErrorCode;
    .param p3, "debugData"    # Lokio/ByteString;

    .line 722
    invoke-virtual {p3}, Lokio/ByteString;->size()I

    .line 727
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    monitor-enter v0

    .line 728
    :try_start_6
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-object v1, v1, Lokhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    iget-object v2, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-object v2, v2, Lokhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    new-array v2, v2, [Lokhttp3/internal/http2/Http2Stream;

    invoke-interface {v1, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lokhttp3/internal/http2/Http2Stream;

    .line 729
    .local v1, "streamsCopy":[Lokhttp3/internal/http2/Http2Stream;
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    const/4 v3, 0x1

    iput-boolean v3, v2, Lokhttp3/internal/http2/Http2Connection;->shutdown:Z

    .line 730
    monitor-exit v0
    :try_end_24
    .catchall {:try_start_6 .. :try_end_24} :catchall_48

    .line 733
    array-length v0, v1

    const/4 v2, 0x0

    :goto_26
    if-ge v2, v0, :cond_47

    aget-object v3, v1, v2

    .line 734
    .local v3, "http2Stream":Lokhttp3/internal/http2/Http2Stream;
    invoke-virtual {v3}, Lokhttp3/internal/http2/Http2Stream;->getId()I

    move-result v4

    if-le v4, p1, :cond_44

    invoke-virtual {v3}, Lokhttp3/internal/http2/Http2Stream;->isLocallyInitiated()Z

    move-result v4

    if-eqz v4, :cond_44

    .line 735
    sget-object v4, Lokhttp3/internal/http2/ErrorCode;->REFUSED_STREAM:Lokhttp3/internal/http2/ErrorCode;

    invoke-virtual {v3, v4}, Lokhttp3/internal/http2/Http2Stream;->receiveRstStream(Lokhttp3/internal/http2/ErrorCode;)V

    .line 736
    iget-object v4, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v3}, Lokhttp3/internal/http2/Http2Stream;->getId()I

    move-result v5

    invoke-virtual {v4, v5}, Lokhttp3/internal/http2/Http2Connection;->removeStream(I)Lokhttp3/internal/http2/Http2Stream;

    .line 733
    .end local v3    # "http2Stream":Lokhttp3/internal/http2/Http2Stream;
    :cond_44
    add-int/lit8 v2, v2, 0x1

    goto :goto_26

    .line 739
    :cond_47
    return-void

    .line 730
    .end local v1    # "streamsCopy":[Lokhttp3/internal/http2/Http2Stream;
    :catchall_48
    move-exception v1

    :try_start_49
    monitor-exit v0
    :try_end_4a
    .catchall {:try_start_49 .. :try_end_4a} :catchall_48

    goto :goto_4c

    :goto_4b
    throw v1

    :goto_4c
    goto :goto_4b
.end method

.method public headers(ZIILjava/util/List;)V
    .registers 16
    .param p1, "inFinished"    # Z
    .param p2, "streamId"    # I
    .param p3, "associatedStreamId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZII",
            "Ljava/util/List<",
            "Lokhttp3/internal/http2/Header;",
            ">;)V"
        }
    .end annotation

    .line 604
    .local p4, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/http2/Header;>;"
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0, p2}, Lokhttp3/internal/http2/Http2Connection;->pushedStream(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 605
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0, p2, p4, p1}, Lokhttp3/internal/http2/Http2Connection;->pushHeadersLater(ILjava/util/List;Z)V

    .line 606
    return-void

    .line 609
    :cond_e
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    monitor-enter v0

    .line 611
    :try_start_11
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-boolean v1, v1, Lokhttp3/internal/http2/Http2Connection;->shutdown:Z

    if-eqz v1, :cond_19

    monitor-exit v0

    return-void

    .line 613
    :cond_19
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v1, p2}, Lokhttp3/internal/http2/Http2Connection;->getStream(I)Lokhttp3/internal/http2/Http2Stream;

    move-result-object v1

    .line 615
    .local v1, "stream":Lokhttp3/internal/http2/Http2Stream;
    if-nez v1, :cond_6e

    .line 617
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget v2, v2, Lokhttp3/internal/http2/Http2Connection;->lastGoodStreamId:I

    if-gt p2, v2, :cond_29

    monitor-exit v0

    return-void

    .line 620
    :cond_29
    rem-int/lit8 v2, p2, 0x2

    iget-object v3, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget v3, v3, Lokhttp3/internal/http2/Http2Connection;->nextStreamId:I

    const/4 v4, 0x2

    rem-int/2addr v3, v4

    if-ne v2, v3, :cond_35

    monitor-exit v0

    return-void

    .line 623
    :cond_35
    new-instance v2, Lokhttp3/internal/http2/Http2Stream;

    iget-object v7, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    const/4 v8, 0x0

    move-object v5, v2

    move v6, p2

    move v9, p1

    move-object v10, p4

    invoke-direct/range {v5 .. v10}, Lokhttp3/internal/http2/Http2Stream;-><init>(ILokhttp3/internal/http2/Http2Connection;ZZLjava/util/List;)V

    .line 625
    .local v2, "newStream":Lokhttp3/internal/http2/Http2Stream;
    iget-object v3, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iput p2, v3, Lokhttp3/internal/http2/Http2Connection;->lastGoodStreamId:I

    .line 626
    iget-object v3, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-object v3, v3, Lokhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 627
    sget-object v3, Lokhttp3/internal/http2/Http2Connection;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v5, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable$1;

    const-string v6, "OkHttp %s stream %d"

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-object v8, v8, Lokhttp3/internal/http2/Http2Connection;->hostname:Ljava/lang/String;

    aput-object v8, v4, v7

    const/4 v7, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v4, v7

    invoke-direct {v5, p0, v6, v4, v2}, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable$1;-><init>(Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;Ljava/lang/String;[Ljava/lang/Object;Lokhttp3/internal/http2/Http2Stream;)V

    invoke-interface {v3, v5}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 640
    monitor-exit v0

    return-void

    .line 642
    .end local v2    # "newStream":Lokhttp3/internal/http2/Http2Stream;
    :cond_6e
    monitor-exit v0
    :try_end_6f
    .catchall {:try_start_11 .. :try_end_6f} :catchall_78

    .line 645
    invoke-virtual {v1, p4}, Lokhttp3/internal/http2/Http2Stream;->receiveHeaders(Ljava/util/List;)V

    .line 646
    if-eqz p1, :cond_77

    invoke-virtual {v1}, Lokhttp3/internal/http2/Http2Stream;->receiveFin()V

    .line 647
    :cond_77
    return-void

    .line 642
    .end local v1    # "stream":Lokhttp3/internal/http2/Http2Stream;
    :catchall_78
    move-exception v1

    :try_start_79
    monitor-exit v0
    :try_end_7a
    .catchall {:try_start_79 .. :try_end_7a} :catchall_78

    throw v1
.end method

.method public ping(ZII)V
    .registers 7
    .param p1, "reply"    # Z
    .param p2, "payload1"    # I
    .param p3, "payload2"    # I

    .line 710
    if-eqz p1, :cond_e

    .line 711
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0, p2}, Lokhttp3/internal/http2/Http2Connection;->removePing(I)Lokhttp3/internal/http2/Ping;

    move-result-object v0

    .line 712
    .local v0, "ping":Lokhttp3/internal/http2/Ping;
    if-eqz v0, :cond_d

    .line 713
    invoke-virtual {v0}, Lokhttp3/internal/http2/Ping;->receive()V

    .line 715
    .end local v0    # "ping":Lokhttp3/internal/http2/Ping;
    :cond_d
    goto :goto_15

    .line 717
    :cond_e
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p2, p3, v2}, Lokhttp3/internal/http2/Http2Connection;->writePingLater(ZIILokhttp3/internal/http2/Ping;)V

    .line 719
    :goto_15
    return-void
.end method

.method public priority(IIIZ)V
    .registers 5
    .param p1, "streamId"    # I
    .param p2, "streamDependency"    # I
    .param p3, "weight"    # I
    .param p4, "exclusive"    # Z

    .line 760
    return-void
.end method

.method public pushPromise(IILjava/util/List;)V
    .registers 5
    .param p1, "streamId"    # I
    .param p2, "promisedStreamId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Lokhttp3/internal/http2/Header;",
            ">;)V"
        }
    .end annotation

    .line 764
    .local p3, "requestHeaders":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/http2/Header;>;"
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0, p2, p3}, Lokhttp3/internal/http2/Http2Connection;->pushRequestLater(ILjava/util/List;)V

    .line 765
    return-void
.end method

.method public rstStream(ILokhttp3/internal/http2/ErrorCode;)V
    .registers 4
    .param p1, "streamId"    # I
    .param p2, "errorCode"    # Lokhttp3/internal/http2/ErrorCode;

    .line 650
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0, p1}, Lokhttp3/internal/http2/Http2Connection;->pushedStream(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 651
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0, p1, p2}, Lokhttp3/internal/http2/Http2Connection;->pushResetLater(ILokhttp3/internal/http2/ErrorCode;)V

    .line 652
    return-void

    .line 654
    :cond_e
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0, p1}, Lokhttp3/internal/http2/Http2Connection;->removeStream(I)Lokhttp3/internal/http2/Http2Stream;

    move-result-object v0

    .line 655
    .local v0, "rstStream":Lokhttp3/internal/http2/Http2Stream;
    if-eqz v0, :cond_19

    .line 656
    invoke-virtual {v0, p2}, Lokhttp3/internal/http2/Http2Stream;->receiveRstStream(Lokhttp3/internal/http2/ErrorCode;)V

    .line 658
    :cond_19
    return-void
.end method

.method public settings(ZLokhttp3/internal/http2/Settings;)V
    .registers 15
    .param p1, "clearPrevious"    # Z
    .param p2, "newSettings"    # Lokhttp3/internal/http2/Settings;

    .line 661
    const-wide/16 v0, 0x0

    .line 662
    .local v0, "delta":J
    const/4 v2, 0x0

    .line 663
    .local v2, "streamsToNotify":[Lokhttp3/internal/http2/Http2Stream;
    iget-object v3, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    monitor-enter v3

    .line 664
    :try_start_6
    iget-object v4, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-object v4, v4, Lokhttp3/internal/http2/Http2Connection;->peerSettings:Lokhttp3/internal/http2/Settings;

    invoke-virtual {v4}, Lokhttp3/internal/http2/Settings;->getInitialWindowSize()I

    move-result v4

    .line 665
    .local v4, "priorWriteWindowSize":I
    if-eqz p1, :cond_17

    iget-object v5, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-object v5, v5, Lokhttp3/internal/http2/Http2Connection;->peerSettings:Lokhttp3/internal/http2/Settings;

    invoke-virtual {v5}, Lokhttp3/internal/http2/Settings;->clear()V

    .line 666
    :cond_17
    iget-object v5, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-object v5, v5, Lokhttp3/internal/http2/Http2Connection;->peerSettings:Lokhttp3/internal/http2/Settings;

    invoke-virtual {v5, p2}, Lokhttp3/internal/http2/Settings;->merge(Lokhttp3/internal/http2/Settings;)V

    .line 667
    invoke-direct {p0, p2}, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->applyAndAckSettings(Lokhttp3/internal/http2/Settings;)V

    .line 668
    iget-object v5, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-object v5, v5, Lokhttp3/internal/http2/Http2Connection;->peerSettings:Lokhttp3/internal/http2/Settings;

    invoke-virtual {v5}, Lokhttp3/internal/http2/Settings;->getInitialWindowSize()I

    move-result v5

    .line 669
    .local v5, "peerInitialWindowSize":I
    const/4 v6, -0x1

    const/4 v7, 0x1

    if-eq v5, v6, :cond_64

    if-eq v5, v4, :cond_64

    .line 670
    sub-int v6, v5, v4

    int-to-long v0, v6

    .line 671
    iget-object v6, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-boolean v6, v6, Lokhttp3/internal/http2/Http2Connection;->receivedInitialPeerSettings:Z

    if-nez v6, :cond_41

    .line 672
    iget-object v6, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v6, v0, v1}, Lokhttp3/internal/http2/Http2Connection;->addBytesToWriteWindow(J)V

    .line 673
    iget-object v6, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iput-boolean v7, v6, Lokhttp3/internal/http2/Http2Connection;->receivedInitialPeerSettings:Z

    .line 675
    :cond_41
    iget-object v6, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-object v6, v6, Lokhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_64

    .line 676
    iget-object v6, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-object v6, v6, Lokhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    iget-object v8, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-object v8, v8, Lokhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->size()I

    move-result v8

    new-array v8, v8, [Lokhttp3/internal/http2/Http2Stream;

    invoke-interface {v6, v8}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lokhttp3/internal/http2/Http2Stream;

    move-object v2, v6

    .line 679
    :cond_64
    sget-object v6, Lokhttp3/internal/http2/Http2Connection;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v8, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable$2;

    const-string v9, "OkHttp %s settings"

    new-array v7, v7, [Ljava/lang/Object;

    iget-object v10, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-object v10, v10, Lokhttp3/internal/http2/Http2Connection;->hostname:Ljava/lang/String;

    const/4 v11, 0x0

    aput-object v10, v7, v11

    invoke-direct {v8, p0, v9, v7}, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable$2;-><init>(Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {v6, v8}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 684
    .end local v4    # "priorWriteWindowSize":I
    .end local v5    # "peerInitialWindowSize":I
    monitor-exit v3
    :try_end_7a
    .catchall {:try_start_6 .. :try_end_7a} :catchall_93

    .line 685
    if-eqz v2, :cond_92

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-eqz v5, :cond_92

    .line 686
    array-length v3, v2

    :goto_83
    if-ge v11, v3, :cond_92

    aget-object v4, v2, v11

    .line 687
    .local v4, "stream":Lokhttp3/internal/http2/Http2Stream;
    monitor-enter v4

    .line 688
    :try_start_88
    invoke-virtual {v4, v0, v1}, Lokhttp3/internal/http2/Http2Stream;->addBytesToWriteWindow(J)V

    .line 689
    monitor-exit v4

    .line 686
    .end local v4    # "stream":Lokhttp3/internal/http2/Http2Stream;
    add-int/lit8 v11, v11, 0x1

    goto :goto_83

    .line 689
    .restart local v4    # "stream":Lokhttp3/internal/http2/Http2Stream;
    :catchall_8f
    move-exception v3

    monitor-exit v4
    :try_end_91
    .catchall {:try_start_88 .. :try_end_91} :catchall_8f

    throw v3

    .line 692
    .end local v4    # "stream":Lokhttp3/internal/http2/Http2Stream;
    :cond_92
    return-void

    .line 684
    :catchall_93
    move-exception v4

    :try_start_94
    monitor-exit v3
    :try_end_95
    .catchall {:try_start_94 .. :try_end_95} :catchall_93

    goto :goto_97

    :goto_96
    throw v4

    :goto_97
    goto :goto_96
.end method

.method public windowUpdate(IJ)V
    .registers 8
    .param p1, "streamId"    # I
    .param p2, "windowSizeIncrement"    # J

    .line 742
    if-nez p1, :cond_16

    .line 743
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    monitor-enter v0

    .line 744
    :try_start_5
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    iget-wide v2, v1, Lokhttp3/internal/http2/Http2Connection;->bytesLeftInWriteWindow:J

    add-long/2addr v2, p2

    iput-wide v2, v1, Lokhttp3/internal/http2/Http2Connection;->bytesLeftInWriteWindow:J

    .line 745
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 746
    monitor-exit v0

    goto :goto_27

    :catchall_13
    move-exception v1

    monitor-exit v0
    :try_end_15
    .catchall {:try_start_5 .. :try_end_15} :catchall_13

    throw v1

    .line 748
    :cond_16
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0, p1}, Lokhttp3/internal/http2/Http2Connection;->getStream(I)Lokhttp3/internal/http2/Http2Stream;

    move-result-object v0

    .line 749
    .local v0, "stream":Lokhttp3/internal/http2/Http2Stream;
    if-eqz v0, :cond_27

    .line 750
    monitor-enter v0

    .line 751
    :try_start_1f
    invoke-virtual {v0, p2, p3}, Lokhttp3/internal/http2/Http2Stream;->addBytesToWriteWindow(J)V

    .line 752
    monitor-exit v0

    goto :goto_27

    :catchall_24
    move-exception v1

    monitor-exit v0
    :try_end_26
    .catchall {:try_start_1f .. :try_end_26} :catchall_24

    throw v1

    .line 755
    .end local v0    # "stream":Lokhttp3/internal/http2/Http2Stream;
    :cond_27
    :goto_27
    return-void
.end method
