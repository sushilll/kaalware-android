.class public Lokio/AsyncTimeout;
.super Lokio/Timeout;
.source "AsyncTimeout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokio/AsyncTimeout$Watchdog;
    }
.end annotation


# static fields
.field private static final IDLE_TIMEOUT_MILLIS:J

.field private static final IDLE_TIMEOUT_NANOS:J

.field private static final TIMEOUT_WRITE_SIZE:I = 0x10000

.field private static head:Lokio/AsyncTimeout;


# instance fields
.field private inQueue:Z

.field private next:Lokio/AsyncTimeout;

.field private timeoutAt:J


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 49
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x3c

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lokio/AsyncTimeout;->IDLE_TIMEOUT_MILLIS:J

    .line 50
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-wide v1, Lokio/AsyncTimeout;->IDLE_TIMEOUT_MILLIS:J

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    sput-wide v0, Lokio/AsyncTimeout;->IDLE_TIMEOUT_NANOS:J

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 40
    invoke-direct {p0}, Lokio/Timeout;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lokio/AsyncTimeout;
    .registers 1

    .line 40
    sget-object v0, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    return-object v0
.end method

.method static synthetic access$002(Lokio/AsyncTimeout;)Lokio/AsyncTimeout;
    .registers 1
    .param p0, "x0"    # Lokio/AsyncTimeout;

    .line 40
    sput-object p0, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    return-object p0
.end method

.method static awaitTimeout()Lokio/AsyncTimeout;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 341
    sget-object v0, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    iget-object v0, v0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    .line 344
    .local v0, "node":Lokio/AsyncTimeout;
    const/4 v1, 0x0

    if-nez v0, :cond_26

    .line 345
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    .line 346
    .local v2, "startNanos":J
    const-class v4, Lokio/AsyncTimeout;

    sget-wide v5, Lokio/AsyncTimeout;->IDLE_TIMEOUT_MILLIS:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/Object;->wait(J)V

    .line 347
    sget-object v4, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    iget-object v4, v4, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    if-nez v4, :cond_25

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    sub-long/2addr v4, v2

    sget-wide v6, Lokio/AsyncTimeout;->IDLE_TIMEOUT_NANOS:J

    cmp-long v8, v4, v6

    if-ltz v8, :cond_25

    sget-object v1, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    :cond_25
    return-object v1

    .line 352
    .end local v2    # "startNanos":J
    :cond_26
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Lokio/AsyncTimeout;->remainingNanos(J)J

    move-result-wide v2

    .line 355
    .local v2, "waitNanos":J
    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_43

    .line 358
    const-wide/32 v4, 0xf4240

    div-long v6, v2, v4

    .line 359
    .local v6, "waitMillis":J
    mul-long v4, v4, v6

    sub-long/2addr v2, v4

    .line 360
    const-class v4, Lokio/AsyncTimeout;

    long-to-int v5, v2

    invoke-virtual {v4, v6, v7, v5}, Ljava/lang/Object;->wait(JI)V

    .line 361
    return-object v1

    .line 365
    .end local v6    # "waitMillis":J
    :cond_43
    sget-object v4, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    iget-object v5, v0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    iput-object v5, v4, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    .line 366
    iput-object v1, v0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    .line 367
    return-object v0
.end method

.method private static declared-synchronized cancelScheduledTimeout(Lokio/AsyncTimeout;)Z
    .registers 4
    .param p0, "node"    # Lokio/AsyncTimeout;

    const-class v0, Lokio/AsyncTimeout;

    monitor-enter v0

    .line 127
    :try_start_3
    sget-object v1, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    .local v1, "prev":Lokio/AsyncTimeout;
    :goto_5
    if-eqz v1, :cond_19

    .line 128
    iget-object v2, v1, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    if-ne v2, p0, :cond_15

    .line 129
    iget-object v2, p0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    iput-object v2, v1, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    .line 130
    const/4 v2, 0x0

    iput-object v2, p0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_1c

    .line 131
    const/4 v2, 0x0

    monitor-exit v0

    return v2

    .line 127
    :cond_15
    :try_start_15
    iget-object v2, v1, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;
    :try_end_17
    .catchall {:try_start_15 .. :try_end_17} :catchall_1c

    move-object v1, v2

    goto :goto_5

    .line 136
    .end local v1    # "prev":Lokio/AsyncTimeout;
    :cond_19
    const/4 v1, 0x1

    monitor-exit v0

    return v1

    .line 126
    .end local p0    # "node":Lokio/AsyncTimeout;
    :catchall_1c
    move-exception p0

    monitor-exit v0

    goto :goto_20

    :goto_1f
    throw p0

    :goto_20
    goto :goto_1f
.end method

.method private remainingNanos(J)J
    .registers 5
    .param p1, "now"    # J

    .line 144
    iget-wide v0, p0, Lokio/AsyncTimeout;->timeoutAt:J

    sub-long/2addr v0, p1

    return-wide v0
.end method

.method private static declared-synchronized scheduleTimeout(Lokio/AsyncTimeout;JZ)V
    .registers 13
    .param p0, "node"    # Lokio/AsyncTimeout;
    .param p1, "timeoutNanos"    # J
    .param p3, "hasDeadline"    # Z

    const-class v0, Lokio/AsyncTimeout;

    monitor-enter v0

    .line 85
    :try_start_3
    sget-object v1, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    if-nez v1, :cond_16

    .line 86
    new-instance v1, Lokio/AsyncTimeout;

    invoke-direct {v1}, Lokio/AsyncTimeout;-><init>()V

    sput-object v1, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    .line 87
    new-instance v1, Lokio/AsyncTimeout$Watchdog;

    invoke-direct {v1}, Lokio/AsyncTimeout$Watchdog;-><init>()V

    invoke-virtual {v1}, Lokio/AsyncTimeout$Watchdog;->start()V

    .line 90
    :cond_16
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    .line 91
    .local v1, "now":J
    const-wide/16 v3, 0x0

    cmp-long v5, p1, v3

    if-eqz v5, :cond_2f

    if-eqz p3, :cond_2f

    .line 94
    invoke-virtual {p0}, Lokio/AsyncTimeout;->deadlineNanoTime()J

    move-result-wide v3

    sub-long/2addr v3, v1

    invoke-static {p1, p2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    add-long/2addr v3, v1

    iput-wide v3, p0, Lokio/AsyncTimeout;->timeoutAt:J

    goto :goto_40

    .line 95
    :cond_2f
    cmp-long v5, p1, v3

    if-eqz v5, :cond_38

    .line 96
    add-long v3, v1, p1

    iput-wide v3, p0, Lokio/AsyncTimeout;->timeoutAt:J

    goto :goto_40

    .line 97
    :cond_38
    if-eqz p3, :cond_6a

    .line 98
    invoke-virtual {p0}, Lokio/AsyncTimeout;->deadlineNanoTime()J

    move-result-wide v3

    iput-wide v3, p0, Lokio/AsyncTimeout;->timeoutAt:J

    .line 104
    :goto_40
    invoke-direct {p0, v1, v2}, Lokio/AsyncTimeout;->remainingNanos(J)J

    move-result-wide v3

    .line 105
    .local v3, "remainingNanos":J
    sget-object v5, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    .line 106
    .local v5, "prev":Lokio/AsyncTimeout;
    :goto_46
    iget-object v6, v5, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    if-eqz v6, :cond_59

    iget-object v6, v5, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    invoke-direct {v6, v1, v2}, Lokio/AsyncTimeout;->remainingNanos(J)J

    move-result-wide v6

    cmp-long v8, v3, v6

    if-gez v8, :cond_55

    goto :goto_59

    .line 105
    :cond_55
    iget-object v6, v5, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    move-object v5, v6

    goto :goto_46

    .line 107
    :cond_59
    :goto_59
    iget-object v6, v5, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    iput-object v6, p0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    .line 108
    iput-object p0, v5, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    .line 109
    sget-object v6, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    if-ne v5, v6, :cond_68

    .line 110
    const-class v6, Lokio/AsyncTimeout;

    invoke-virtual {v6}, Ljava/lang/Object;->notify()V
    :try_end_68
    .catchall {:try_start_3 .. :try_end_68} :catchall_70

    .line 115
    .end local v5    # "prev":Lokio/AsyncTimeout;
    :cond_68
    monitor-exit v0

    return-void

    .line 100
    .end local v3    # "remainingNanos":J
    :cond_6a
    :try_start_6a
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3
    :try_end_70
    .catchall {:try_start_6a .. :try_end_70} :catchall_70

    .line 84
    .end local v1    # "now":J
    .end local p0    # "node":Lokio/AsyncTimeout;
    .end local p1    # "timeoutNanos":J
    .end local p3    # "hasDeadline":Z
    :catchall_70
    move-exception p0

    monitor-exit v0

    goto :goto_74

    :goto_73
    throw p0

    :goto_74
    goto :goto_73
.end method


# virtual methods
.method public final enter()V
    .registers 7

    .line 72
    iget-boolean v0, p0, Lokio/AsyncTimeout;->inQueue:Z

    if-nez v0, :cond_1c

    .line 73
    invoke-virtual {p0}, Lokio/AsyncTimeout;->timeoutNanos()J

    move-result-wide v0

    .line 74
    .local v0, "timeoutNanos":J
    invoke-virtual {p0}, Lokio/AsyncTimeout;->hasDeadline()Z

    move-result v2

    .line 75
    .local v2, "hasDeadline":Z
    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-nez v5, :cond_15

    if-nez v2, :cond_15

    .line 76
    return-void

    .line 78
    :cond_15
    const/4 v3, 0x1

    iput-boolean v3, p0, Lokio/AsyncTimeout;->inQueue:Z

    .line 79
    invoke-static {p0, v0, v1, v2}, Lokio/AsyncTimeout;->scheduleTimeout(Lokio/AsyncTimeout;JZ)V

    .line 80
    return-void

    .line 72
    .end local v0    # "timeoutNanos":J
    .end local v2    # "hasDeadline":Z
    :cond_1c
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unbalanced enter/exit"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final exit(Ljava/io/IOException;)Ljava/io/IOException;
    .registers 3
    .param p1, "cause"    # Ljava/io/IOException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 283
    invoke-virtual {p0}, Lokio/AsyncTimeout;->exit()Z

    move-result v0

    if-nez v0, :cond_7

    return-object p1

    .line 284
    :cond_7
    invoke-virtual {p0, p1}, Lokio/AsyncTimeout;->newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    return-object v0
.end method

.method final exit(Z)V
    .registers 4
    .param p1, "throwOnTimeout"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 273
    invoke-virtual {p0}, Lokio/AsyncTimeout;->exit()Z

    move-result v0

    .line 274
    .local v0, "timedOut":Z
    if-eqz v0, :cond_f

    if-nez p1, :cond_9

    goto :goto_f

    :cond_9
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lokio/AsyncTimeout;->newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v1

    throw v1

    .line 275
    :cond_f
    :goto_f
    return-void
.end method

.method public final exit()Z
    .registers 3

    .line 119
    iget-boolean v0, p0, Lokio/AsyncTimeout;->inQueue:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 120
    :cond_6
    iput-boolean v1, p0, Lokio/AsyncTimeout;->inQueue:Z

    .line 121
    invoke-static {p0}, Lokio/AsyncTimeout;->cancelScheduledTimeout(Lokio/AsyncTimeout;)Z

    move-result v0

    return v0
.end method

.method protected newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;
    .registers 4
    .param p1, "cause"    # Ljava/io/IOException;

    .line 293
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "timeout"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 294
    .local v0, "e":Ljava/io/InterruptedIOException;
    if-eqz p1, :cond_c

    .line 295
    invoke-virtual {v0, p1}, Ljava/io/InterruptedIOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 297
    :cond_c
    return-object v0
.end method

.method public final sink(Lokio/Sink;)Lokio/Sink;
    .registers 3
    .param p1, "sink"    # Lokio/Sink;

    .line 159
    new-instance v0, Lokio/AsyncTimeout$1;

    invoke-direct {v0, p0, p1}, Lokio/AsyncTimeout$1;-><init>(Lokio/AsyncTimeout;Lokio/Sink;)V

    return-object v0
.end method

.method public final source(Lokio/Source;)Lokio/Source;
    .registers 3
    .param p1, "source"    # Lokio/Source;

    .line 231
    new-instance v0, Lokio/AsyncTimeout$2;

    invoke-direct {v0, p0, p1}, Lokio/AsyncTimeout$2;-><init>(Lokio/AsyncTimeout;Lokio/Source;)V

    return-object v0
.end method

.method protected timedOut()V
    .registers 1

    .line 152
    return-void
.end method
