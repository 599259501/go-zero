{{.head}}

package {{.filePackage}}

import (
	"context"

	{{.pbPackage}}
	{{if ne .pbPackage .protoGoPackage}}{{.protoGoPackage}}{{end}}

	"github.com/zeromicro/go-zero/zrpc"
	"google.golang.org/grpc"
)

type (
	{{.alias}}

	I{{.serviceName}} interface {
		{{.interface}}
	}

	default{{.serviceName}} struct {
		cli zrpc.Client
	}
)

func New{{.serviceName}}(cli zrpc.Client) I{{.serviceName}} {
	return &default{{.serviceName}}{
		cli: cli,
	}
}

{{.functions}}
