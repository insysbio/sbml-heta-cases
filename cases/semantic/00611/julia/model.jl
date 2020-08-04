#= 
    This code was generated by heta-compiler of v0.5.9
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  :k__reaction1_local,
)}(Float64[
  5,
])

### initialization of ODE variables and Records
function start_(cons)
    #(k__reaction1_local,) = cons

    # Heta initialize
    t = 0.0 # initial time
    k = 0.75
    C = 1.0
    S2 = 0.0 / C
    S3 = 1.0 / C
    S1 = 1.0 / C
    reaction1 = C * cons[1] * S1
    
    # save results

    return (
        [
            S1 * C,
            S2 * C,
        ],
        
        [
            C,
            k,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,k,) = p.static
    (S1_,S2_,) = u 

    # Heta rules
    S2 = S2_ / C
    S3 = k * S2
    S1 = S1_ / C
    reaction1 = C * cons[1] * S1
    
    #p.static .= [C,k,]
    du .= [
      -reaction1,  # dS1_/dt
      reaction1,  # dS2_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,k,) = integrator.p.static
        (S1_,S2_,) = u

        # Heta rules
        S2 = S2_ / C
        S3 = k * S2
        S1 = S1_ / C
        reaction1 = C * cons[1] * S1
        
        # calculate amounts
        C_ = C
        S3_ = S3 * C
        reaction1_ = reaction1
        k_ = k

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events

### continous events

### event assignments


### OUTPUT ###

x00611 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00611 = x00611
)
tasks = ()

export models, tasks

end
