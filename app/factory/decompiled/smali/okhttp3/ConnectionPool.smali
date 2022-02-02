.class public final Lokhttp3/ConnectionPool;
.super Ljava/lang/Object;
.source "ConnectionPool.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final executor:Ljava/util/concurrent/Executor;


# instance fields
.field private final cleanupRunnable:Ljava/lang/Runnable;

.field cleanupRunning:Z

.field private final connections:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lokhttp3/internal/connection/RealConnection;",
            ">;"
        }
    .end annotation
.end field

.field private final keepAliveDurationNs:J

.field private final maxIdleConnections:I

.field final routeDatabase:Lokhttp3/internal/connection/RouteDatabase;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 42
    nop

    .line 48
    new-instance v8, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v1, 0x0

    const v2, 0x7fffffff

    const-wide/16 v3, 0x3c

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/SynchronousQueue;

    invoke-direct {v6}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    const/4 v0, 0x1

    .line 50
    const-string v7, "OkHttp ConnectionPool"

    invoke-static {v7, v0}, Lokhttp3/internal/Util;->threadFactory(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;

    move-result-object v7

    move-object v0, v8

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    sput-object v8, Lokhttp3/ConnectionPool;->executor:Ljava/util/concurrent/Executor;

    .line 48
    return-void
.end method

.method public constructor <init>()V
    .registers 5

    .line 84
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const/4 v1, 0x5

    const-wide/16 v2, 0x5

    invoke-direct {p0, v1, v2, v3, v0}, Lokhttp3/ConnectionPool;-><init>(IJLjava/util/concurrent/TimeUnit;)V

    .line 85
    return-void
.end method

.method public constructor <init>(IJLjava/util/concurrent/TimeUnit;)V
    .registers 8
    .param p1, "maxIdleConnections"    # I
    .param p2, "keepAliveDuration"    # J
    .param p4, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Lokhttp3/ConnectionPool$1;

    invoke-direct {v0, p0}, Lokhttp3/ConnectionPool$1;-><init>(Lokhttp3/ConnectionPool;)V

    iput-object v0, p0, Lokhttp3/ConnectionPool;->cleanupRunnable:Ljava/lang/Runnable;

    .line 74
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lokhttp3/ConnectionPool;->connections:Ljava/util/Deque;

    .line 75
    new-instance v0, Lokhttp3/internal/connection/RouteDatabase;

    invoke-direct {v0}, Lokhttp3/internal/connection/RouteDatabase;-><init>()V

    iput-object v0, p0, Lokhttp3/ConnectionPool;->routeDatabase:Lokhttp3/internal/connection/RouteDatabase;

    .line 88
    iput p1, p0, Lokhttp3/ConnectionPool;->maxIdleConnections:I

    .line 89
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    iput-wide v0, p0, Lokhttp3/ConnectionPool;->keepAliveDurationNs:J

    .line 92
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-lez v2, :cond_27

    .line 95
    return-void

    .line 93
    :cond_27
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "keepAliveDuration <= 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private pruneAndGetAllocationCount(Lokhttp3/internal/connection/RealConnection;J)I
    .registers 11
    .param p1, "connection"    # Lokhttp3/internal/connection/RealConnection;
    .param p2, "now"    # J

    .line 238
    iget-object v0, p1, Lokhttp3/internal/connection/RealConnection;->allocations:Ljava/util/List;

    .line 239
    .local v0, "references":Ljava/util/List;, "Ljava/util/List<Ljava/lang/ref/Reference<Lokhttp3/internal/connection/StreamAllocation;>;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_5b

    .line 240
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/Reference;

    .line 242
    .local v2, "reference":Ljava/lang/ref/Reference;, "Ljava/lang/ref/Reference<Lokhttp3/internal/connection/StreamAllocation;>;"
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_18

    .line 243
    add-int/lit8 v1, v1, 0x1

    .line 244
    goto :goto_3

    .line 248
    :cond_18
    move-object v3, v2

    check-cast v3, Lokhttp3/internal/connection/StreamAllocation$StreamAllocationReference;

    .line 250
    .local v3, "streamAllocRef":Lokhttp3/internal/connection/StreamAllocation$StreamAllocationReference;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "A connection to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lokhttp3/internal/connection/RealConnection;->route()Lokhttp3/Route;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/Route;->address()Lokhttp3/Address;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/Address;->url()Lokhttp3/HttpUrl;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " was leaked. Did you forget to close a response body?"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 252
    .local v4, "message":Ljava/lang/String;
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    move-result-object v5

    iget-object v6, v3, Lokhttp3/internal/connection/StreamAllocation$StreamAllocationReference;->callStackTrace:Ljava/lang/Object;

    invoke-virtual {v5, v4, v6}, Lokhttp3/internal/platform/Platform;->logCloseableLeak(Ljava/lang/String;Ljava/lang/Object;)V

    .line 254
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 255
    const/4 v5, 0x1

    iput-boolean v5, p1, Lokhttp3/internal/connection/RealConnection;->noNewStreams:Z

    .line 258
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_5a

    .line 259
    iget-wide v5, p0, Lokhttp3/ConnectionPool;->keepAliveDurationNs:J

    sub-long v5, p2, v5

    iput-wide v5, p1, Lokhttp3/internal/connection/RealConnection;->idleAtNanos:J

    .line 260
    const/4 v5, 0x0

    return v5

    .line 262
    .end local v2    # "reference":Ljava/lang/ref/Reference;, "Ljava/lang/ref/Reference<Lokhttp3/internal/connection/StreamAllocation;>;"
    .end local v3    # "streamAllocRef":Lokhttp3/internal/connection/StreamAllocation$StreamAllocationReference;
    .end local v4    # "message":Ljava/lang/String;
    :cond_5a
    goto :goto_3

    .line 264
    .end local v1    # "i":I
    :cond_5b
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    return v1
.end method


# virtual methods
.method cleanup(J)J
    .registers 13
    .param p1, "now"    # J

    .line 181
    const/4 v0, 0x0

    .line 182
    .local v0, "inUseConnectionCount":I
    const/4 v1, 0x0

    .line 183
    .local v1, "idleConnectionCount":I
    const/4 v2, 0x0

    .line 184
    .local v2, "longestIdleConnection":Lokhttp3/internal/connection/RealConnection;
    const-wide/high16 v3, -0x8000000000000000L

    .line 187
    .local v3, "longestIdleDurationNs":J
    monitor-enter p0

    .line 188
    :try_start_6
    iget-object v5, p0, Lokhttp3/ConnectionPool;->connections:Ljava/util/Deque;

    invoke-interface {v5}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lokhttp3/internal/connection/RealConnection;>;"
    :goto_c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2e

    .line 189
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lokhttp3/internal/connection/RealConnection;

    .line 192
    .local v6, "connection":Lokhttp3/internal/connection/RealConnection;
    invoke-direct {p0, v6, p1, p2}, Lokhttp3/ConnectionPool;->pruneAndGetAllocationCount(Lokhttp3/internal/connection/RealConnection;J)I

    move-result v7

    if-lez v7, :cond_21

    .line 193
    add-int/lit8 v0, v0, 0x1

    .line 194
    goto :goto_c

    .line 197
    :cond_21
    add-int/lit8 v1, v1, 0x1

    .line 200
    iget-wide v7, v6, Lokhttp3/internal/connection/RealConnection;->idleAtNanos:J

    sub-long v7, p1, v7

    .line 201
    .local v7, "idleDurationNs":J
    cmp-long v9, v7, v3

    if-lez v9, :cond_2d

    .line 202
    move-wide v3, v7

    .line 203
    move-object v2, v6

    .line 205
    .end local v6    # "connection":Lokhttp3/internal/connection/RealConnection;
    .end local v7    # "idleDurationNs":J
    :cond_2d
    goto :goto_c

    .line 207
    .end local v5    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lokhttp3/internal/connection/RealConnection;>;"
    :cond_2e
    iget-wide v5, p0, Lokhttp3/ConnectionPool;->keepAliveDurationNs:J

    cmp-long v7, v3, v5

    if-gez v7, :cond_4d

    iget v5, p0, Lokhttp3/ConnectionPool;->maxIdleConnections:I

    if-le v1, v5, :cond_39

    goto :goto_4d

    .line 212
    :cond_39
    if-lez v1, :cond_40

    .line 214
    iget-wide v5, p0, Lokhttp3/ConnectionPool;->keepAliveDurationNs:J

    sub-long/2addr v5, v3

    monitor-exit p0

    return-wide v5

    .line 215
    :cond_40
    if-lez v0, :cond_46

    .line 217
    iget-wide v5, p0, Lokhttp3/ConnectionPool;->keepAliveDurationNs:J

    monitor-exit p0

    return-wide v5

    .line 220
    :cond_46
    const/4 v5, 0x0

    iput-boolean v5, p0, Lokhttp3/ConnectionPool;->cleanupRunning:Z

    .line 221
    const-wide/16 v5, -0x1

    monitor-exit p0

    return-wide v5

    .line 211
    :cond_4d
    :goto_4d
    iget-object v5, p0, Lokhttp3/ConnectionPool;->connections:Ljava/util/Deque;

    invoke-interface {v5, v2}, Ljava/util/Deque;->remove(Ljava/lang/Object;)Z

    .line 223
    monitor-exit p0
    :try_end_53
    .catchall {:try_start_6 .. :try_end_53} :catchall_5d

    .line 225
    invoke-virtual {v2}, Lokhttp3/internal/connection/RealConnection;->socket()Ljava/net/Socket;

    move-result-object v5

    invoke-static {v5}, Lokhttp3/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 228
    const-wide/16 v5, 0x0

    return-wide v5

    .line 223
    :catchall_5d
    move-exception v5

    :try_start_5e
    monitor-exit p0
    :try_end_5f
    .catchall {:try_start_5e .. :try_end_5f} :catchall_5d

    goto :goto_61

    :goto_60
    throw v5

    :goto_61
    goto :goto_60
.end method

.method connectionBecameIdle(Lokhttp3/internal/connection/RealConnection;)Z
    .registers 3
    .param p1, "connection"    # Lokhttp3/internal/connection/RealConnection;

    .line 144
    nop

    .line 145
    iget-boolean v0, p1, Lokhttp3/internal/connection/RealConnection;->noNewStreams:Z

    if-nez v0, :cond_f

    iget v0, p0, Lokhttp3/ConnectionPool;->maxIdleConnections:I

    if-nez v0, :cond_a

    goto :goto_f

    .line 149
    :cond_a
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 150
    const/4 v0, 0x0

    return v0

    .line 146
    :cond_f
    :goto_f
    iget-object v0, p0, Lokhttp3/ConnectionPool;->connections:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->remove(Ljava/lang/Object;)Z

    .line 147
    const/4 v0, 0x1

    return v0
.end method

.method public declared-synchronized connectionCount()I
    .registers 2

    monitor-enter p0

    .line 113
    :try_start_1
    iget-object v0, p0, Lokhttp3/ConnectionPool;->connections:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->size()I

    move-result v0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    monitor-exit p0

    return v0

    .end local p0    # "this":Lokhttp3/ConnectionPool;
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public evictAll()V
    .registers 5

    .line 156
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 157
    .local v0, "evictedConnections":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/connection/RealConnection;>;"
    monitor-enter p0

    .line 158
    :try_start_6
    iget-object v1, p0, Lokhttp3/ConnectionPool;->connections:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lokhttp3/internal/connection/RealConnection;>;"
    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 159
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lokhttp3/internal/connection/RealConnection;

    .line 160
    .local v2, "connection":Lokhttp3/internal/connection/RealConnection;
    iget-object v3, v2, Lokhttp3/internal/connection/RealConnection;->allocations:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_29

    .line 161
    const/4 v3, 0x1

    iput-boolean v3, v2, Lokhttp3/internal/connection/RealConnection;->noNewStreams:Z

    .line 162
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 165
    .end local v2    # "connection":Lokhttp3/internal/connection/RealConnection;
    :cond_29
    goto :goto_c

    .line 166
    .end local v1    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lokhttp3/internal/connection/RealConnection;>;"
    :cond_2a
    monitor-exit p0
    :try_end_2b
    .catchall {:try_start_6 .. :try_end_2b} :catchall_44

    .line 168
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_43

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lokhttp3/internal/connection/RealConnection;

    .line 169
    .restart local v2    # "connection":Lokhttp3/internal/connection/RealConnection;
    invoke-virtual {v2}, Lokhttp3/internal/connection/RealConnection;->socket()Ljava/net/Socket;

    move-result-object v3

    invoke-static {v3}, Lokhttp3/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 170
    .end local v2    # "connection":Lokhttp3/internal/connection/RealConnection;
    goto :goto_2f

    .line 171
    :cond_43
    return-void

    .line 166
    :catchall_44
    move-exception v1

    :try_start_45
    monitor-exit p0
    :try_end_46
    .catchall {:try_start_45 .. :try_end_46} :catchall_44

    goto :goto_48

    :goto_47
    throw v1

    :goto_48
    goto :goto_47
.end method

.method get(Lokhttp3/Address;Lokhttp3/internal/connection/StreamAllocation;)Lokhttp3/internal/connection/RealConnection;
    .registers 7
    .param p1, "address"    # Lokhttp3/Address;
    .param p2, "streamAllocation"    # Lokhttp3/internal/connection/StreamAllocation;

    .line 118
    nop

    .line 119
    iget-object v0, p0, Lokhttp3/ConnectionPool;->connections:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_32

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lokhttp3/internal/connection/RealConnection;

    .line 120
    .local v1, "connection":Lokhttp3/internal/connection/RealConnection;
    iget-object v2, v1, Lokhttp3/internal/connection/RealConnection;->allocations:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    iget v3, v1, Lokhttp3/internal/connection/RealConnection;->allocationLimit:I

    if-ge v2, v3, :cond_31

    .line 121
    invoke-virtual {v1}, Lokhttp3/internal/connection/RealConnection;->route()Lokhttp3/Route;

    move-result-object v2

    iget-object v2, v2, Lokhttp3/Route;->address:Lokhttp3/Address;

    invoke-virtual {p1, v2}, Lokhttp3/Address;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    iget-boolean v2, v1, Lokhttp3/internal/connection/RealConnection;->noNewStreams:Z

    if-nez v2, :cond_31

    .line 123
    invoke-virtual {p2, v1}, Lokhttp3/internal/connection/StreamAllocation;->acquire(Lokhttp3/internal/connection/RealConnection;)V

    .line 124
    return-object v1

    .line 126
    .end local v1    # "connection":Lokhttp3/internal/connection/RealConnection;
    :cond_31
    goto :goto_7

    .line 127
    :cond_32
    const/4 v0, 0x0

    return-object v0
.end method

.method public declared-synchronized idleConnectionCount()I
    .registers 5

    monitor-enter p0

    .line 99
    const/4 v0, 0x0

    .line 100
    .local v0, "total":I
    :try_start_2
    iget-object v1, p0, Lokhttp3/ConnectionPool;->connections:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lokhttp3/internal/connection/RealConnection;

    .line 101
    .local v2, "connection":Lokhttp3/internal/connection/RealConnection;
    iget-object v3, v2, Lokhttp3/internal/connection/RealConnection;->allocations:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3
    :try_end_1a
    .catchall {:try_start_2 .. :try_end_1a} :catchall_21

    if-eqz v3, :cond_1e

    add-int/lit8 v0, v0, 0x1

    .line 102
    .end local v2    # "connection":Lokhttp3/internal/connection/RealConnection;
    :cond_1e
    goto :goto_8

    .line 103
    .end local p0    # "this":Lokhttp3/ConnectionPool;
    :cond_1f
    monitor-exit p0

    return v0

    .line 98
    .end local v0    # "total":I
    :catchall_21
    move-exception v0

    monitor-exit p0

    goto :goto_25

    :goto_24
    throw v0

    :goto_25
    goto :goto_24
.end method

.method put(Lokhttp3/internal/connection/RealConnection;)V
    .registers 4
    .param p1, "connection"    # Lokhttp3/internal/connection/RealConnection;

    .line 131
    nop

    .line 132
    iget-boolean v0, p0, Lokhttp3/ConnectionPool;->cleanupRunning:Z

    if-nez v0, :cond_f

    .line 133
    const/4 v0, 0x1

    iput-boolean v0, p0, Lokhttp3/ConnectionPool;->cleanupRunning:Z

    .line 134
    sget-object v0, Lokhttp3/ConnectionPool;->executor:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Lokhttp3/ConnectionPool;->cleanupRunnable:Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 136
    :cond_f
    iget-object v0, p0, Lokhttp3/ConnectionPool;->connections:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 137
    return-void
.end method
