#= 
    This code was generated by heta-compiler of v0.5.8
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  
)}(Float64[
  
])

### initialization of ODE variables and Records
function start_(cons)
    #() = cons

    # Heta initialize
    t = 0.0 # initial time
    c = 2.0 / 3.0
    c_proc = 0.5 * c
    
    # save results

    return (
        [
            c,
        ],
        
        [
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    () = p.static
    (c_,) = u 

    # Heta rules
    c = c_
    c_proc = 0.5 * c
    
    #p.static .= []
    du .= [
      c_proc,  # dc_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        () = integrator.p.static
        (c_,) = u

        # Heta rules
        c = c_
        c_proc = 0.5 * c
        
        # calculate amounts
        c_proc_ = c_proc

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events


### continous events


### event assignments


### OUTPUT ###

x00916 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00916 = x00916
)
tasks = ()

export models, tasks

end
