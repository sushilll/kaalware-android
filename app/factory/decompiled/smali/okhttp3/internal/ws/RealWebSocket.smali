.class public final Lokhttp3/internal/ws/RealWebSocket;
.super Ljava/lang/Object;
.source "RealWebSocket.java"

# interfaces
.implements Lokhttp3/WebSocket;
.implements Lokhttp3/internal/ws/WebSocketReader$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/internal/ws/RealWebSocket$CancelRunnable;,
        Lokhttp3/internal/ws/RealWebSocket$ClientStreams;,
        Lokhttp3/internal/ws/RealWebSocket$Streams;,
        Lokhttp3/internal/ws/RealWebSocket$Close;,
        Lokhttp3/internal/ws/RealWebSocket$Message;,
        Lokhttp3/internal/ws/RealWebSocket$PingRunnable;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final CANCEL_AFTER_CLOSE_MILLIS:J = 0xea60L

.field private static final MAX_QUEUE_SIZE:J = 0x1000000L

.field private static final ONLY_HTTP1:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lokhttp3/Protocol;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private call:Lokhttp3/Call;

.field private cancelFuture:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field private enqueuedClose:Z

.field private executor:Ljava/util/concurrent/ScheduledExecutorService;

.field private failed:Z

.field private final key:Ljava/lang/String;

.field final listener:Lokhttp3/WebSocketListener;

.field private final messageAndCloseQueue:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final originalRequest:Lokhttp3/Request;

.field pingCount:I

.field pongCount:I

.field private final pongQueue:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Lokio/ByteString;",
            ">;"
        }
    .end annotation
.end field

.field private queueSize:J

.field private final random:Ljava/util/Random;

.field private reader:Lokhttp3/internal/ws/WebSocketReader;

.field private receivedCloseCode:I

.field private receivedCloseReason:Ljava/lang/String;

.field private streams:Lokhttp3/internal/ws/RealWebSocket$Streams;

.field private writer:Lokhttp3/internal/ws/WebSocketWriter;

.field private final writerRunnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 52
    nop

    .line 53
    sget-object v0, Lokhttp3/Protocol;->HTTP_1_1:Lokhttp3/Protocol;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/ws/RealWebSocket;->ONLY_HTTP1:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lokhttp3/Request;Lokhttp3/WebSocketListener;Ljava/util/Random;)V
    .registers 7
    .param p1, "request"    # Lokhttp3/Request;
    .param p2, "listener"    # Lokhttp3/WebSocketListener;
    .param p3, "random"    # Ljava/util/Random;

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->pongQueue:Ljava/util/ArrayDeque;

    .line 102
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    .line 117
    const/4 v0, -0x1

    iput v0, p0, Lokhttp3/internal/ws/RealWebSocket;->receivedCloseCode:I

    .line 132
    invoke-virtual {p1}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object v0

    const-string v1, "GET"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 135
    iput-object p1, p0, Lokhttp3/internal/ws/RealWebSocket;->originalRequest:Lokhttp3/Request;

    .line 136
    iput-object p2, p0, Lokhttp3/internal/ws/RealWebSocket;->listener:Lokhttp3/WebSocketListener;

    .line 137
    iput-object p3, p0, Lokhttp3/internal/ws/RealWebSocket;->random:Ljava/util/Random;

    .line 139
    const/16 v0, 0x10

    new-array v0, v0, [B

    .line 140
    .local v0, "nonce":[B
    invoke-virtual {p3, v0}, Ljava/util/Random;->nextBytes([B)V

    .line 141
    invoke-static {v0}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v1

    invoke-virtual {v1}, Lokio/ByteString;->base64()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lokhttp3/internal/ws/RealWebSocket;->key:Ljava/lang/String;

    .line 143
    new-instance v1, Lokhttp3/internal/ws/RealWebSocket$1;

    invoke-direct {v1, p0}, Lokhttp3/internal/ws/RealWebSocket$1;-><init>(Lokhttp3/internal/ws/RealWebSocket;)V

    iput-object v1, p0, Lokhttp3/internal/ws/RealWebSocket;->writerRunnable:Ljava/lang/Runnable;

    .line 153
    return-void

    .line 133
    .end local v0    # "nonce":[B
    :cond_3f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Request must be GET: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic access$100(Lokhttp3/internal/ws/RealWebSocket;)V
    .registers 1
    .param p0, "x0"    # Lokhttp3/internal/ws/RealWebSocket;

    .line 52
    invoke-direct {p0}, Lokhttp3/internal/ws/RealWebSocket;->writePingFrame()V

    return-void
.end method

.method private runWriter()V
    .registers 3

    .line 401
    nop

    .line 403
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_a

    .line 404
    iget-object v1, p0, Lokhttp3/internal/ws/RealWebSocket;->writerRunnable:Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 406
    :cond_a
    return-void
.end method

.method private declared-synchronized send(Lokio/ByteString;I)Z
    .registers 9
    .param p1, "data"    # Lokio/ByteString;
    .param p2, "formatOpcode"    # I

    monitor-enter p0

    .line 350
    :try_start_1
    iget-boolean v0, p0, Lokhttp3/internal/ws/RealWebSocket;->failed:Z

    const/4 v1, 0x0

    if-nez v0, :cond_3c

    iget-boolean v0, p0, Lokhttp3/internal/ws/RealWebSocket;->enqueuedClose:Z

    if-eqz v0, :cond_b

    goto :goto_3c

    .line 353
    :cond_b
    iget-wide v2, p0, Lokhttp3/internal/ws/RealWebSocket;->queueSize:J

    invoke-virtual {p1}, Lokio/ByteString;->size()I

    move-result v0

    int-to-long v4, v0

    add-long/2addr v2, v4

    const-wide/32 v4, 0x1000000

    cmp-long v0, v2, v4

    if-lez v0, :cond_22

    .line 354
    const/16 v0, 0x3e9

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lokhttp3/internal/ws/RealWebSocket;->close(ILjava/lang/String;)Z
    :try_end_20
    .catchall {:try_start_1 .. :try_end_20} :catchall_3e

    .line 355
    monitor-exit p0

    return v1

    .line 359
    .end local p0    # "this":Lokhttp3/internal/ws/RealWebSocket;
    :cond_22
    :try_start_22
    iget-wide v0, p0, Lokhttp3/internal/ws/RealWebSocket;->queueSize:J

    invoke-virtual {p1}, Lokio/ByteString;->size()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lokhttp3/internal/ws/RealWebSocket;->queueSize:J

    .line 360
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    new-instance v1, Lokhttp3/internal/ws/RealWebSocket$Message;

    invoke-direct {v1, p2, p1}, Lokhttp3/internal/ws/RealWebSocket$Message;-><init>(ILokio/ByteString;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 361
    invoke-direct {p0}, Lokhttp3/internal/ws/RealWebSocket;->runWriter()V
    :try_end_39
    .catchall {:try_start_22 .. :try_end_39} :catchall_3e

    .line 362
    const/4 v0, 0x1

    monitor-exit p0

    return v0

    .line 350
    :cond_3c
    :goto_3c
    monitor-exit p0

    return v1

    .line 349
    .end local p1    # "data":Lokio/ByteString;
    .end local p2    # "formatOpcode":I
    :catchall_3e
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private writePingFrame()V
    .registers 4

    .line 497
    monitor-enter p0

    .line 498
    :try_start_1
    iget-boolean v0, p0, Lokhttp3/internal/ws/RealWebSocket;->failed:Z

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    .line 499
    :cond_7
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->writer:Lokhttp3/internal/ws/WebSocketWriter;

    .line 500
    .local v0, "writer":Lokhttp3/internal/ws/WebSocketWriter;
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_16

    .line 503
    :try_start_a
    sget-object v1, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    invoke-virtual {v0, v1}, Lokhttp3/internal/ws/WebSocketWriter;->writePing(Lokio/ByteString;)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_f} :catch_10

    .line 506
    goto :goto_15

    .line 504
    :catch_10
    move-exception v1

    .line 505
    .local v1, "e":Ljava/io/IOException;
    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lokhttp3/internal/ws/RealWebSocket;->failWebSocket(Ljava/lang/Exception;Lokhttp3/Response;)V

    .line 507
    .end local v1    # "e":Ljava/io/IOException;
    :goto_15
    return-void

    .line 500
    .end local v0    # "writer":Lokhttp3/internal/ws/WebSocketWriter;
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .line 164
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->call:Lokhttp3/Call;

    invoke-interface {v0}, Lokhttp3/Call;->cancel()V

    .line 165
    return-void
.end method

.method checkResponse(Lokhttp3/Response;)V
    .registers 10
    .param p1, "response"    # Lokhttp3/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/ProtocolException;
        }
    .end annotation

    .line 213
    invoke-virtual {p1}, Lokhttp3/Response;->code()I

    move-result v0

    const-string v1, "\'"

    const/16 v2, 0x65

    if-ne v0, v2, :cond_a6

    .line 218
    const-string v0, "Connection"

    invoke-virtual {p1, v0}, Lokhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 219
    .local v0, "headerConnection":Ljava/lang/String;
    const-string v2, "Upgrade"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8c

    .line 224
    invoke-virtual {p1, v2}, Lokhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 225
    .local v2, "headerUpgrade":Ljava/lang/String;
    const-string v3, "websocket"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_72

    .line 230
    const-string v3, "Sec-WebSocket-Accept"

    invoke-virtual {p1, v3}, Lokhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 231
    .local v3, "headerAccept":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lokhttp3/internal/ws/RealWebSocket;->key:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v4

    .line 232
    invoke-virtual {v4}, Lokio/ByteString;->sha1()Lokio/ByteString;

    move-result-object v4

    invoke-virtual {v4}, Lokio/ByteString;->base64()Ljava/lang/String;

    move-result-object v4

    .line 233
    .local v4, "acceptExpected":Ljava/lang/String;
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_50

    .line 237
    return-void

    .line 234
    :cond_50
    new-instance v5, Ljava/net/ProtocolException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Expected \'Sec-WebSocket-Accept\' header value \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "\' but was \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v5, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 226
    .end local v3    # "headerAccept":Ljava/lang/String;
    .end local v4    # "acceptExpected":Ljava/lang/String;
    :cond_72
    new-instance v3, Ljava/net/ProtocolException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expected \'Upgrade\' header value \'websocket\' but was \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 220
    .end local v2    # "headerUpgrade":Ljava/lang/String;
    :cond_8c
    new-instance v2, Ljava/net/ProtocolException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expected \'Connection\' header value \'Upgrade\' but was \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 214
    .end local v0    # "headerConnection":Ljava/lang/String;
    :cond_a6
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected HTTP 101 response but was \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    invoke-virtual {p1}, Lokhttp3/Response;->code()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lokhttp3/Response;->message()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close(ILjava/lang/String;)Z
    .registers 5
    .param p1, "code"    # I
    .param p2, "reason"    # Ljava/lang/String;

    .line 375
    const-wide/32 v0, 0xea60

    invoke-virtual {p0, p1, p2, v0, v1}, Lokhttp3/internal/ws/RealWebSocket;->close(ILjava/lang/String;J)Z

    move-result v0

    return v0
.end method

.method declared-synchronized close(ILjava/lang/String;J)Z
    .registers 11
    .param p1, "code"    # I
    .param p2, "reason"    # Ljava/lang/String;
    .param p3, "cancelAfterCloseMillis"    # J

    monitor-enter p0

    .line 379
    :try_start_1
    invoke-static {p1}, Lokhttp3/internal/ws/WebSocketProtocol;->validateCloseCode(I)V

    .line 381
    const/4 v0, 0x0

    .line 382
    .local v0, "reasonBytes":Lokio/ByteString;
    if-eqz p2, :cond_2f

    .line 383
    invoke-static {p2}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v1

    move-object v0, v1

    .line 384
    invoke-virtual {v0}, Lokio/ByteString;->size()I

    move-result v1

    int-to-long v1, v1

    const-wide/16 v3, 0x7b

    cmp-long v5, v1, v3

    if-gtz v5, :cond_18

    goto :goto_2f

    .line 385
    :cond_18
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "reason.size() > 123: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 389
    .end local p0    # "this":Lokhttp3/internal/ws/RealWebSocket;
    :cond_2f
    :goto_2f
    iget-boolean v1, p0, Lokhttp3/internal/ws/RealWebSocket;->failed:Z

    if-nez v1, :cond_4a

    iget-boolean v1, p0, Lokhttp3/internal/ws/RealWebSocket;->enqueuedClose:Z

    if-eqz v1, :cond_38

    goto :goto_4a

    .line 392
    :cond_38
    const/4 v1, 0x1

    iput-boolean v1, p0, Lokhttp3/internal/ws/RealWebSocket;->enqueuedClose:Z

    .line 395
    iget-object v2, p0, Lokhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    new-instance v3, Lokhttp3/internal/ws/RealWebSocket$Close;

    invoke-direct {v3, p1, v0, p3, p4}, Lokhttp3/internal/ws/RealWebSocket$Close;-><init>(ILokio/ByteString;J)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 396
    invoke-direct {p0}, Lokhttp3/internal/ws/RealWebSocket;->runWriter()V
    :try_end_48
    .catchall {:try_start_1 .. :try_end_48} :catchall_4d

    .line 397
    monitor-exit p0

    return v1

    .line 389
    :cond_4a
    :goto_4a
    const/4 v1, 0x0

    monitor-exit p0

    return v1

    .line 378
    .end local v0    # "reasonBytes":Lokio/ByteString;
    .end local p1    # "code":I
    .end local p2    # "reason":Ljava/lang/String;
    .end local p3    # "cancelAfterCloseMillis":J
    :catchall_4d
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public connect(Lokhttp3/OkHttpClient;)V
    .registers 6
    .param p1, "client"    # Lokhttp3/OkHttpClient;

    .line 168
    invoke-virtual {p1}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    sget-object v1, Lokhttp3/internal/ws/RealWebSocket;->ONLY_HTTP1:Ljava/util/List;

    .line 169
    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->protocols(Ljava/util/List;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 170
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object p1

    .line 171
    invoke-virtual {p1}, Lokhttp3/OkHttpClient;->pingIntervalMillis()I

    move-result v0

    .line 172
    .local v0, "pingIntervalMillis":I
    iget-object v1, p0, Lokhttp3/internal/ws/RealWebSocket;->originalRequest:Lokhttp3/Request;

    invoke-virtual {v1}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object v1

    .line 173
    const-string v2, "Upgrade"

    const-string v3, "websocket"

    invoke-virtual {v1, v2, v3}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    .line 174
    const-string v3, "Connection"

    invoke-virtual {v1, v3, v2}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    iget-object v2, p0, Lokhttp3/internal/ws/RealWebSocket;->key:Ljava/lang/String;

    .line 175
    const-string v3, "Sec-WebSocket-Key"

    invoke-virtual {v1, v3, v2}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    .line 176
    const-string v2, "Sec-WebSocket-Version"

    const-string v3, "13"

    invoke-virtual {v1, v2, v3}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    .line 177
    invoke-virtual {v1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    .line 178
    .local v1, "request":Lokhttp3/Request;
    sget-object v2, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    invoke-virtual {v2, p1, v1}, Lokhttp3/internal/Internal;->newWebSocketCall(Lokhttp3/OkHttpClient;Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v2

    iput-object v2, p0, Lokhttp3/internal/ws/RealWebSocket;->call:Lokhttp3/Call;

    .line 179
    iget-object v2, p0, Lokhttp3/internal/ws/RealWebSocket;->call:Lokhttp3/Call;

    new-instance v3, Lokhttp3/internal/ws/RealWebSocket$2;

    invoke-direct {v3, p0, v1, v0}, Lokhttp3/internal/ws/RealWebSocket$2;-><init>(Lokhttp3/internal/ws/RealWebSocket;Lokhttp3/Request;I)V

    invoke-interface {v2, v3}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    .line 210
    return-void
.end method

.method failWebSocket(Ljava/lang/Exception;Lokhttp3/Response;)V
    .registers 6
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "response"    # Lokhttp3/Response;

    .line 511
    monitor-enter p0

    .line 512
    :try_start_1
    iget-boolean v0, p0, Lokhttp3/internal/ws/RealWebSocket;->failed:Z

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    .line 513
    :cond_7
    const/4 v0, 0x1

    iput-boolean v0, p0, Lokhttp3/internal/ws/RealWebSocket;->failed:Z

    .line 514
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->streams:Lokhttp3/internal/ws/RealWebSocket$Streams;

    .line 515
    .local v0, "streamsToClose":Lokhttp3/internal/ws/RealWebSocket$Streams;
    const/4 v1, 0x0

    iput-object v1, p0, Lokhttp3/internal/ws/RealWebSocket;->streams:Lokhttp3/internal/ws/RealWebSocket$Streams;

    .line 516
    iget-object v1, p0, Lokhttp3/internal/ws/RealWebSocket;->cancelFuture:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_19

    iget-object v1, p0, Lokhttp3/internal/ws/RealWebSocket;->cancelFuture:Ljava/util/concurrent/ScheduledFuture;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 517
    :cond_19
    iget-object v1, p0, Lokhttp3/internal/ws/RealWebSocket;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v1, :cond_22

    iget-object v1, p0, Lokhttp3/internal/ws/RealWebSocket;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    .line 518
    :cond_22
    monitor-exit p0
    :try_end_23
    .catchall {:try_start_1 .. :try_end_23} :catchall_32

    .line 521
    :try_start_23
    iget-object v1, p0, Lokhttp3/internal/ws/RealWebSocket;->listener:Lokhttp3/WebSocketListener;

    invoke-virtual {v1, p0, p1, p2}, Lokhttp3/WebSocketListener;->onFailure(Lokhttp3/WebSocket;Ljava/lang/Throwable;Lokhttp3/Response;)V
    :try_end_28
    .catchall {:try_start_23 .. :try_end_28} :catchall_2d

    .line 523
    invoke-static {v0}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 524
    nop

    .line 525
    return-void

    .line 523
    :catchall_2d
    move-exception v1

    invoke-static {v0}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    throw v1

    .line 518
    .end local v0    # "streamsToClose":Lokhttp3/internal/ws/RealWebSocket$Streams;
    :catchall_32
    move-exception v0

    :try_start_33
    monitor-exit p0
    :try_end_34
    .catchall {:try_start_33 .. :try_end_34} :catchall_32

    throw v0
.end method

.method public initReaderAndWriter(Ljava/lang/String;JLokhttp3/internal/ws/RealWebSocket$Streams;)V
    .registers 15
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "pingIntervalMillis"    # J
    .param p4, "streams"    # Lokhttp3/internal/ws/RealWebSocket$Streams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 241
    monitor-enter p0

    .line 242
    :try_start_1
    iput-object p4, p0, Lokhttp3/internal/ws/RealWebSocket;->streams:Lokhttp3/internal/ws/RealWebSocket$Streams;

    .line 243
    new-instance v0, Lokhttp3/internal/ws/WebSocketWriter;

    iget-boolean v1, p4, Lokhttp3/internal/ws/RealWebSocket$Streams;->client:Z

    iget-object v2, p4, Lokhttp3/internal/ws/RealWebSocket$Streams;->sink:Lokio/BufferedSink;

    iget-object v3, p0, Lokhttp3/internal/ws/RealWebSocket;->random:Ljava/util/Random;

    invoke-direct {v0, v1, v2, v3}, Lokhttp3/internal/ws/WebSocketWriter;-><init>(ZLokio/BufferedSink;Ljava/util/Random;)V

    iput-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->writer:Lokhttp3/internal/ws/WebSocketWriter;

    .line 244
    new-instance v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {p1, v2}, Lokhttp3/internal/Util;->threadFactory(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    iput-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    .line 245
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-eqz v2, :cond_32

    .line 246
    iget-object v3, p0, Lokhttp3/internal/ws/RealWebSocket;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v4, Lokhttp3/internal/ws/RealWebSocket$PingRunnable;

    const/4 v0, 0x0

    invoke-direct {v4, p0, v0}, Lokhttp3/internal/ws/RealWebSocket$PingRunnable;-><init>(Lokhttp3/internal/ws/RealWebSocket;Lokhttp3/internal/ws/RealWebSocket$1;)V

    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide v5, p2

    move-wide v7, p2

    invoke-interface/range {v3 .. v9}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 249
    :cond_32
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3d

    .line 250
    invoke-direct {p0}, Lokhttp3/internal/ws/RealWebSocket;->runWriter()V

    .line 252
    :cond_3d
    monitor-exit p0
    :try_end_3e
    .catchall {:try_start_1 .. :try_end_3e} :catchall_4a

    .line 254
    new-instance v0, Lokhttp3/internal/ws/WebSocketReader;

    iget-boolean v1, p4, Lokhttp3/internal/ws/RealWebSocket$Streams;->client:Z

    iget-object v2, p4, Lokhttp3/internal/ws/RealWebSocket$Streams;->source:Lokio/BufferedSource;

    invoke-direct {v0, v1, v2, p0}, Lokhttp3/internal/ws/WebSocketReader;-><init>(ZLokio/BufferedSource;Lokhttp3/internal/ws/WebSocketReader$FrameCallback;)V

    iput-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->reader:Lokhttp3/internal/ws/WebSocketReader;

    .line 255
    return-void

    .line 252
    :catchall_4a
    move-exception v0

    :try_start_4b
    monitor-exit p0
    :try_end_4c
    .catchall {:try_start_4b .. :try_end_4c} :catchall_4a

    throw v0
.end method

.method public loopReader()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 259
    :goto_0
    iget v0, p0, Lokhttp3/internal/ws/RealWebSocket;->receivedCloseCode:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_b

    .line 261
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->reader:Lokhttp3/internal/ws/WebSocketReader;

    invoke-virtual {v0}, Lokhttp3/internal/ws/WebSocketReader;->processNextFrame()V

    goto :goto_0

    .line 263
    :cond_b
    return-void
.end method

.method public onReadClose(ILjava/lang/String;)V
    .registers 6
    .param p1, "code"    # I
    .param p2, "reason"    # Ljava/lang/String;

    .line 310
    const/4 v0, -0x1

    if-eq p1, v0, :cond_50

    .line 312
    const/4 v1, 0x0

    .line 313
    .local v1, "toClose":Lokhttp3/internal/ws/RealWebSocket$Streams;
    monitor-enter p0

    .line 314
    :try_start_5
    iget v2, p0, Lokhttp3/internal/ws/RealWebSocket;->receivedCloseCode:I

    if-ne v2, v0, :cond_45

    .line 315
    iput p1, p0, Lokhttp3/internal/ws/RealWebSocket;->receivedCloseCode:I

    .line 316
    iput-object p2, p0, Lokhttp3/internal/ws/RealWebSocket;->receivedCloseReason:Ljava/lang/String;

    .line 317
    iget-boolean v0, p0, Lokhttp3/internal/ws/RealWebSocket;->enqueuedClose:Z

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 318
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->streams:Lokhttp3/internal/ws/RealWebSocket$Streams;

    move-object v1, v0

    .line 319
    const/4 v0, 0x0

    iput-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->streams:Lokhttp3/internal/ws/RealWebSocket$Streams;

    .line 320
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->cancelFuture:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_29

    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->cancelFuture:Ljava/util/concurrent/ScheduledFuture;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 321
    :cond_29
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    .line 323
    :cond_2e
    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_5 .. :try_end_2f} :catchall_4d

    .line 326
    :try_start_2f
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->listener:Lokhttp3/WebSocketListener;

    invoke-virtual {v0, p0, p1, p2}, Lokhttp3/WebSocketListener;->onClosing(Lokhttp3/WebSocket;ILjava/lang/String;)V

    .line 328
    if-eqz v1, :cond_3b

    .line 329
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->listener:Lokhttp3/WebSocketListener;

    invoke-virtual {v0, p0, p1, p2}, Lokhttp3/WebSocketListener;->onClosed(Lokhttp3/WebSocket;ILjava/lang/String;)V
    :try_end_3b
    .catchall {:try_start_2f .. :try_end_3b} :catchall_40

    .line 332
    :cond_3b
    invoke-static {v1}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 333
    nop

    .line 334
    return-void

    .line 332
    :catchall_40
    move-exception v0

    invoke-static {v1}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    throw v0

    .line 314
    :cond_45
    :try_start_45
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "already closed"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v1    # "toClose":Lokhttp3/internal/ws/RealWebSocket$Streams;
    .end local p1    # "code":I
    .end local p2    # "reason":Ljava/lang/String;
    throw v0

    .line 323
    .restart local v1    # "toClose":Lokhttp3/internal/ws/RealWebSocket$Streams;
    .restart local p1    # "code":I
    .restart local p2    # "reason":Ljava/lang/String;
    :catchall_4d
    move-exception v0

    monitor-exit p0
    :try_end_4f
    .catchall {:try_start_45 .. :try_end_4f} :catchall_4d

    throw v0

    .line 310
    .end local v1    # "toClose":Lokhttp3/internal/ws/RealWebSocket$Streams;
    :cond_50
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public onReadMessage(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 288
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->listener:Lokhttp3/WebSocketListener;

    invoke-virtual {v0, p0, p1}, Lokhttp3/WebSocketListener;->onMessage(Lokhttp3/WebSocket;Ljava/lang/String;)V

    .line 289
    return-void
.end method

.method public onReadMessage(Lokio/ByteString;)V
    .registers 3
    .param p1, "bytes"    # Lokio/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 292
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->listener:Lokhttp3/WebSocketListener;

    invoke-virtual {v0, p0, p1}, Lokhttp3/WebSocketListener;->onMessage(Lokhttp3/WebSocket;Lokio/ByteString;)V

    .line 293
    return-void
.end method

.method public declared-synchronized onReadPing(Lokio/ByteString;)V
    .registers 3
    .param p1, "payload"    # Lokio/ByteString;

    monitor-enter p0

    .line 297
    :try_start_1
    iget-boolean v0, p0, Lokhttp3/internal/ws/RealWebSocket;->failed:Z

    if-nez v0, :cond_22

    iget-boolean v0, p0, Lokhttp3/internal/ws/RealWebSocket;->enqueuedClose:Z

    if-eqz v0, :cond_12

    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    goto :goto_22

    .line 299
    .end local p0    # "this":Lokhttp3/internal/ws/RealWebSocket;
    :cond_12
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->pongQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 300
    invoke-direct {p0}, Lokhttp3/internal/ws/RealWebSocket;->runWriter()V

    .line 301
    iget v0, p0, Lokhttp3/internal/ws/RealWebSocket;->pingCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lokhttp3/internal/ws/RealWebSocket;->pingCount:I
    :try_end_20
    .catchall {:try_start_1 .. :try_end_20} :catchall_24

    .line 302
    monitor-exit p0

    return-void

    .line 297
    :cond_22
    :goto_22
    monitor-exit p0

    return-void

    .line 296
    .end local p1    # "payload":Lokio/ByteString;
    :catchall_24
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onReadPong(Lokio/ByteString;)V
    .registers 3
    .param p1, "buffer"    # Lokio/ByteString;

    monitor-enter p0

    .line 306
    :try_start_1
    iget v0, p0, Lokhttp3/internal/ws/RealWebSocket;->pongCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lokhttp3/internal/ws/RealWebSocket;->pongCount:I
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 307
    monitor-exit p0

    return-void

    .line 305
    .end local p0    # "this":Lokhttp3/internal/ws/RealWebSocket;
    .end local p1    # "buffer":Lokio/ByteString;
    :catchall_9
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized pingCount()I
    .registers 2

    monitor-enter p0

    .line 280
    :try_start_1
    iget v0, p0, Lokhttp3/internal/ws/RealWebSocket;->pingCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    .end local p0    # "this":Lokhttp3/internal/ws/RealWebSocket;
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized pong(Lokio/ByteString;)Z
    .registers 3
    .param p1, "payload"    # Lokio/ByteString;

    monitor-enter p0

    .line 367
    :try_start_1
    iget-boolean v0, p0, Lokhttp3/internal/ws/RealWebSocket;->failed:Z

    if-nez v0, :cond_1d

    iget-boolean v0, p0, Lokhttp3/internal/ws/RealWebSocket;->enqueuedClose:Z

    if-eqz v0, :cond_12

    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    goto :goto_1d

    .line 369
    .end local p0    # "this":Lokhttp3/internal/ws/RealWebSocket;
    :cond_12
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->pongQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 370
    invoke-direct {p0}, Lokhttp3/internal/ws/RealWebSocket;->runWriter()V
    :try_end_1a
    .catchall {:try_start_1 .. :try_end_1a} :catchall_20

    .line 371
    const/4 v0, 0x1

    monitor-exit p0

    return v0

    .line 367
    :cond_1d
    :goto_1d
    const/4 v0, 0x0

    monitor-exit p0

    return v0

    .line 366
    .end local p1    # "payload":Lokio/ByteString;
    :catchall_20
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized pongCount()I
    .registers 2

    monitor-enter p0

    .line 284
    :try_start_1
    iget v0, p0, Lokhttp3/internal/ws/RealWebSocket;->pongCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    .end local p0    # "this":Lokhttp3/internal/ws/RealWebSocket;
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method processNextFrame()Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 271
    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lokhttp3/internal/ws/RealWebSocket;->reader:Lokhttp3/internal/ws/WebSocketReader;

    invoke-virtual {v1}, Lokhttp3/internal/ws/WebSocketReader;->processNextFrame()V

    .line 272
    iget v1, p0, Lokhttp3/internal/ws/RealWebSocket;->receivedCloseCode:I
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_8} :catch_d

    const/4 v2, -0x1

    if-ne v1, v2, :cond_c

    const/4 v0, 0x1

    :cond_c
    return v0

    .line 273
    :catch_d
    move-exception v1

    .line 274
    .local v1, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lokhttp3/internal/ws/RealWebSocket;->failWebSocket(Ljava/lang/Exception;Lokhttp3/Response;)V

    .line 275
    return v0
.end method

.method public declared-synchronized queueSize()J
    .registers 3

    monitor-enter p0

    .line 160
    :try_start_1
    iget-wide v0, p0, Lokhttp3/internal/ws/RealWebSocket;->queueSize:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-wide v0

    .end local p0    # "this":Lokhttp3/internal/ws/RealWebSocket;
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public request()Lokhttp3/Request;
    .registers 2

    .line 156
    iget-object v0, p0, Lokhttp3/internal/ws/RealWebSocket;->originalRequest:Lokhttp3/Request;

    return-object v0
.end method

.method public send(Ljava/lang/String;)Z
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .line 339
    if-eqz p1, :cond_c

    .line 340
    invoke-static {p1}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lokhttp3/internal/ws/RealWebSocket;->send(Lokio/ByteString;I)Z

    move-result v0

    return v0

    .line 339
    :cond_c
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "text == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public send(Lokio/ByteString;)Z
    .registers 4
    .param p1, "bytes"    # Lokio/ByteString;

    .line 344
    if-eqz p1, :cond_8

    .line 345
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lokhttp3/internal/ws/RealWebSocket;->send(Lokio/ByteString;I)Z

    move-result v0

    return v0

    .line 344
    :cond_8
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "bytes == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method writeOneFrame()Z
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 424
    const/4 v0, 0x0

    .line 425
    .local v0, "messageOrClose":Ljava/lang/Object;
    const/4 v1, -0x1

    .line 426
    .local v1, "receivedCloseCode":I
    const/4 v2, 0x0

    .line 427
    .local v2, "receivedCloseReason":Ljava/lang/String;
    const/4 v3, 0x0

    .line 429
    .local v3, "streamsToClose":Lokhttp3/internal/ws/RealWebSocket$Streams;
    monitor-enter p0

    .line 430
    :try_start_5
    iget-boolean v4, p0, Lokhttp3/internal/ws/RealWebSocket;->failed:Z

    const/4 v5, 0x0

    if-eqz v4, :cond_c

    .line 431
    monitor-exit p0

    return v5

    .line 434
    :cond_c
    iget-object v4, p0, Lokhttp3/internal/ws/RealWebSocket;->writer:Lokhttp3/internal/ws/WebSocketWriter;

    .line 435
    .local v4, "writer":Lokhttp3/internal/ws/WebSocketWriter;
    iget-object v6, p0, Lokhttp3/internal/ws/RealWebSocket;->pongQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v6}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lokio/ByteString;

    .line 436
    .local v6, "pong":Lokio/ByteString;
    if-nez v6, :cond_52

    .line 437
    iget-object v7, p0, Lokhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v7}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    .line 438
    nop

    instance-of v7, v0, Lokhttp3/internal/ws/RealWebSocket$Close;

    if-eqz v7, :cond_4e

    .line 439
    iget v5, p0, Lokhttp3/internal/ws/RealWebSocket;->receivedCloseCode:I

    move v1, v5

    .line 440
    iget-object v5, p0, Lokhttp3/internal/ws/RealWebSocket;->receivedCloseReason:Ljava/lang/String;

    move-object v2, v5

    .line 441
    const/4 v5, -0x1

    if-eq v1, v5, :cond_39

    .line 442
    iget-object v5, p0, Lokhttp3/internal/ws/RealWebSocket;->streams:Lokhttp3/internal/ws/RealWebSocket$Streams;

    move-object v3, v5

    .line 443
    const/4 v5, 0x0

    iput-object v5, p0, Lokhttp3/internal/ws/RealWebSocket;->streams:Lokhttp3/internal/ws/RealWebSocket$Streams;

    .line 444
    iget-object v5, p0, Lokhttp3/internal/ws/RealWebSocket;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v5}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    goto :goto_52

    .line 447
    :cond_39
    iget-object v5, p0, Lokhttp3/internal/ws/RealWebSocket;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v7, Lokhttp3/internal/ws/RealWebSocket$CancelRunnable;

    invoke-direct {v7, p0}, Lokhttp3/internal/ws/RealWebSocket$CancelRunnable;-><init>(Lokhttp3/internal/ws/RealWebSocket;)V

    move-object v8, v0

    check-cast v8, Lokhttp3/internal/ws/RealWebSocket$Close;

    iget-wide v8, v8, Lokhttp3/internal/ws/RealWebSocket$Close;->cancelAfterCloseMillis:J

    sget-object v10, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v5, v7, v8, v9, v10}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v5

    iput-object v5, p0, Lokhttp3/internal/ws/RealWebSocket;->cancelFuture:Ljava/util/concurrent/ScheduledFuture;

    goto :goto_52

    .line 450
    :cond_4e
    if-nez v0, :cond_52

    .line 451
    monitor-exit p0

    return v5

    .line 454
    :cond_52
    :goto_52
    monitor-exit p0
    :try_end_53
    .catchall {:try_start_5 .. :try_end_53} :catchall_b0

    .line 457
    if-eqz v6, :cond_59

    .line 458
    :try_start_55
    invoke-virtual {v4, v6}, Lokhttp3/internal/ws/WebSocketWriter;->writePong(Lokio/ByteString;)V

    goto :goto_a0

    .line 460
    :cond_59
    instance-of v5, v0, Lokhttp3/internal/ws/RealWebSocket$Message;

    if-eqz v5, :cond_8a

    .line 461
    move-object v5, v0

    check-cast v5, Lokhttp3/internal/ws/RealWebSocket$Message;

    iget-object v5, v5, Lokhttp3/internal/ws/RealWebSocket$Message;->data:Lokio/ByteString;

    .line 462
    .local v5, "data":Lokio/ByteString;
    move-object v7, v0

    check-cast v7, Lokhttp3/internal/ws/RealWebSocket$Message;

    iget v7, v7, Lokhttp3/internal/ws/RealWebSocket$Message;->formatOpcode:I

    .line 463
    invoke-virtual {v5}, Lokio/ByteString;->size()I

    move-result v8

    int-to-long v8, v8

    .line 462
    invoke-virtual {v4, v7, v8, v9}, Lokhttp3/internal/ws/WebSocketWriter;->newMessageSink(IJ)Lokio/Sink;

    move-result-object v7

    invoke-static {v7}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v7

    .line 464
    .local v7, "sink":Lokio/BufferedSink;
    invoke-interface {v7, v5}, Lokio/BufferedSink;->write(Lokio/ByteString;)Lokio/BufferedSink;

    .line 465
    invoke-interface {v7}, Lokio/BufferedSink;->close()V

    .line 466
    monitor-enter p0
    :try_end_7b
    .catchall {:try_start_55 .. :try_end_7b} :catchall_ab

    .line 467
    :try_start_7b
    iget-wide v8, p0, Lokhttp3/internal/ws/RealWebSocket;->queueSize:J

    invoke-virtual {v5}, Lokio/ByteString;->size()I

    move-result v10

    int-to-long v10, v10

    sub-long/2addr v8, v10

    iput-wide v8, p0, Lokhttp3/internal/ws/RealWebSocket;->queueSize:J

    .line 468
    monitor-exit p0

    .line 470
    .end local v5    # "data":Lokio/ByteString;
    .end local v7    # "sink":Lokio/BufferedSink;
    goto :goto_a0

    .line 468
    .restart local v5    # "data":Lokio/ByteString;
    .restart local v7    # "sink":Lokio/BufferedSink;
    :catchall_87
    move-exception v8

    monitor-exit p0
    :try_end_89
    .catchall {:try_start_7b .. :try_end_89} :catchall_87

    .end local v0    # "messageOrClose":Ljava/lang/Object;
    .end local v1    # "receivedCloseCode":I
    .end local v2    # "receivedCloseReason":Ljava/lang/String;
    .end local v3    # "streamsToClose":Lokhttp3/internal/ws/RealWebSocket$Streams;
    .end local v4    # "writer":Lokhttp3/internal/ws/WebSocketWriter;
    .end local v6    # "pong":Lokio/ByteString;
    :try_start_89
    throw v8

    .line 470
    .end local v5    # "data":Lokio/ByteString;
    .end local v7    # "sink":Lokio/BufferedSink;
    .restart local v0    # "messageOrClose":Ljava/lang/Object;
    .restart local v1    # "receivedCloseCode":I
    .restart local v2    # "receivedCloseReason":Ljava/lang/String;
    .restart local v3    # "streamsToClose":Lokhttp3/internal/ws/RealWebSocket$Streams;
    .restart local v4    # "writer":Lokhttp3/internal/ws/WebSocketWriter;
    .restart local v6    # "pong":Lokio/ByteString;
    :cond_8a
    instance-of v5, v0, Lokhttp3/internal/ws/RealWebSocket$Close;

    if-eqz v5, :cond_a5

    .line 471
    move-object v5, v0

    check-cast v5, Lokhttp3/internal/ws/RealWebSocket$Close;

    .line 472
    .local v5, "close":Lokhttp3/internal/ws/RealWebSocket$Close;
    iget v7, v5, Lokhttp3/internal/ws/RealWebSocket$Close;->code:I

    iget-object v8, v5, Lokhttp3/internal/ws/RealWebSocket$Close;->reason:Lokio/ByteString;

    invoke-virtual {v4, v7, v8}, Lokhttp3/internal/ws/WebSocketWriter;->writeClose(ILokio/ByteString;)V

    .line 475
    if-eqz v3, :cond_9f

    .line 476
    iget-object v7, p0, Lokhttp3/internal/ws/RealWebSocket;->listener:Lokhttp3/WebSocketListener;

    invoke-virtual {v7, p0, v1, v2}, Lokhttp3/WebSocketListener;->onClosed(Lokhttp3/WebSocket;ILjava/lang/String;)V
    :try_end_9f
    .catchall {:try_start_89 .. :try_end_9f} :catchall_ab

    .line 479
    .end local v5    # "close":Lokhttp3/internal/ws/RealWebSocket$Close;
    :cond_9f
    nop

    .line 483
    :goto_a0
    const/4 v5, 0x1

    .line 485
    invoke-static {v3}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 483
    return v5

    .line 480
    :cond_a5
    :try_start_a5
    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    .end local v0    # "messageOrClose":Ljava/lang/Object;
    .end local v1    # "receivedCloseCode":I
    .end local v2    # "receivedCloseReason":Ljava/lang/String;
    .end local v3    # "streamsToClose":Lokhttp3/internal/ws/RealWebSocket$Streams;
    .end local v4    # "writer":Lokhttp3/internal/ws/WebSocketWriter;
    .end local v6    # "pong":Lokio/ByteString;
    throw v5
    :try_end_ab
    .catchall {:try_start_a5 .. :try_end_ab} :catchall_ab

    .line 485
    .restart local v0    # "messageOrClose":Ljava/lang/Object;
    .restart local v1    # "receivedCloseCode":I
    .restart local v2    # "receivedCloseReason":Ljava/lang/String;
    .restart local v3    # "streamsToClose":Lokhttp3/internal/ws/RealWebSocket$Streams;
    .restart local v4    # "writer":Lokhttp3/internal/ws/WebSocketWriter;
    .restart local v6    # "pong":Lokio/ByteString;
    :catchall_ab
    move-exception v5

    invoke-static {v3}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    throw v5

    .line 454
    .end local v4    # "writer":Lokhttp3/internal/ws/WebSocketWriter;
    .end local v6    # "pong":Lokio/ByteString;
    :catchall_b0
    move-exception v4

    :try_start_b1
    monitor-exit p0
    :try_end_b2
    .catchall {:try_start_b1 .. :try_end_b2} :catchall_b0

    throw v4
.end method
