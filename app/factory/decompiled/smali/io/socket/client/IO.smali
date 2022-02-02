.class public Lio/socket/client/IO;
.super Ljava/lang/Object;
.source "IO.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/client/IO$Options;
    }
.end annotation


# static fields
.field private static final logger:Ljava/util/logging/Logger;

.field private static final managers:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lio/socket/client/Manager;",
            ">;"
        }
    .end annotation
.end field

.field public static protocol:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 17
    const-class v0, Lio/socket/client/IO;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/client/IO;->logger:Ljava/util/logging/Logger;

    .line 19
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lio/socket/client/IO;->managers:Ljava/util/concurrent/ConcurrentHashMap;

    .line 24
    sget v0, Lio/socket/parser/Parser;->protocol:I

    sput v0, Lio/socket/client/IO;->protocol:I

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setDefaultHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V
    .registers 1
    .param p0, "hostnameVerifier"    # Ljavax/net/ssl/HostnameVerifier;

    .line 31
    sput-object p0, Lio/socket/client/Manager;->defaultHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 32
    return-void
.end method

.method public static setDefaultSSLContext(Ljavax/net/ssl/SSLContext;)V
    .registers 1
    .param p0, "sslContext"    # Ljavax/net/ssl/SSLContext;

    .line 27
    sput-object p0, Lio/socket/client/Manager;->defaultSSLContext:Ljavax/net/ssl/SSLContext;

    .line 28
    return-void
.end method

.method public static socket(Ljava/lang/String;)Lio/socket/client/Socket;
    .registers 2
    .param p0, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .line 37
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lio/socket/client/IO;->socket(Ljava/lang/String;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;

    move-result-object v0

    return-object v0
.end method

.method public static socket(Ljava/lang/String;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;
    .registers 3
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "opts"    # Lio/socket/client/IO$Options;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .line 41
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lio/socket/client/IO;->socket(Ljava/net/URI;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;

    move-result-object v0

    return-object v0
.end method

.method public static socket(Ljava/net/URI;)Lio/socket/client/Socket;
    .registers 2
    .param p0, "uri"    # Ljava/net/URI;

    .line 45
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lio/socket/client/IO;->socket(Ljava/net/URI;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;

    move-result-object v0

    return-object v0
.end method

.method public static socket(Ljava/net/URI;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;
    .registers 11
    .param p0, "uri"    # Ljava/net/URI;
    .param p1, "opts"    # Lio/socket/client/IO$Options;

    .line 56
    if-nez p1, :cond_8

    .line 57
    new-instance v0, Lio/socket/client/IO$Options;

    invoke-direct {v0}, Lio/socket/client/IO$Options;-><init>()V

    move-object p1, v0

    .line 60
    :cond_8
    invoke-static {p0}, Lio/socket/client/Url;->parse(Ljava/net/URI;)Ljava/net/URL;

    move-result-object v0

    .line 63
    .local v0, "parsed":Ljava/net/URL;
    :try_start_c
    invoke-virtual {v0}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v1
    :try_end_10
    .catch Ljava/net/URISyntaxException; {:try_start_c .. :try_end_10} :catch_8d

    .line 66
    .local v1, "source":Ljava/net/URI;
    nop

    .line 67
    invoke-static {v0}, Lio/socket/client/Url;->extractId(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v2

    .line 68
    .local v2, "id":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 69
    .local v3, "path":Ljava/lang/String;
    sget-object v4, Lio/socket/client/IO;->managers:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, v2}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_35

    sget-object v4, Lio/socket/client/IO;->managers:Ljava/util/concurrent/ConcurrentHashMap;

    .line 70
    invoke-virtual {v4, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/socket/client/Manager;

    iget-object v4, v4, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, v3}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_35

    const/4 v4, 0x1

    goto :goto_36

    :cond_35
    const/4 v4, 0x0

    .line 71
    .local v4, "sameNamespace":Z
    :goto_36
    iget-boolean v7, p1, Lio/socket/client/IO$Options;->forceNew:Z

    if-nez v7, :cond_43

    iget-boolean v7, p1, Lio/socket/client/IO$Options;->multiplex:Z

    if-eqz v7, :cond_43

    if-eqz v4, :cond_41

    goto :goto_43

    :cond_41
    const/4 v7, 0x0

    goto :goto_44

    :cond_43
    :goto_43
    const/4 v7, 0x1

    .line 74
    .local v7, "newConnection":Z
    :goto_44
    if-eqz v7, :cond_5b

    .line 75
    sget-object v8, Lio/socket/client/IO;->logger:Ljava/util/logging/Logger;

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v6

    const-string v6, "ignoring socket cache for %s"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8, v5}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 76
    new-instance v5, Lio/socket/client/Manager;

    invoke-direct {v5, v1, p1}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    .local v5, "io":Lio/socket/client/Manager;
    goto :goto_84

    .line 78
    .end local v5    # "io":Lio/socket/client/Manager;
    :cond_5b
    sget-object v8, Lio/socket/client/IO;->managers:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v8, v2}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7c

    .line 79
    sget-object v8, Lio/socket/client/IO;->logger:Ljava/util/logging/Logger;

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v6

    const-string v6, "new io instance for %s"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8, v5}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 80
    sget-object v5, Lio/socket/client/IO;->managers:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v6, Lio/socket/client/Manager;

    invoke-direct {v6, v1, p1}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    invoke-virtual {v5, v2, v6}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    :cond_7c
    sget-object v5, Lio/socket/client/IO;->managers:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v5, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/socket/client/Manager;

    .line 85
    .restart local v5    # "io":Lio/socket/client/Manager;
    :goto_84
    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lio/socket/client/Manager;->socket(Ljava/lang/String;)Lio/socket/client/Socket;

    move-result-object v6

    return-object v6

    .line 64
    .end local v1    # "source":Ljava/net/URI;
    .end local v2    # "id":Ljava/lang/String;
    .end local v3    # "path":Ljava/lang/String;
    .end local v4    # "sameNamespace":Z
    .end local v5    # "io":Lio/socket/client/Manager;
    .end local v7    # "newConnection":Z
    :catch_8d
    move-exception v1

    .line 65
    .local v1, "e":Ljava/net/URISyntaxException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method
